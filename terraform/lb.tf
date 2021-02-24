resource "aws_lb" "portfolio-lb" { #ロードバランサーの定義
  name                       = "portfolio-lb"
  load_balancer_type         = "application"
  internal                   = false
  idle_timeout               = 60
  enable_deletion_protection = false

  subnets = [
    aws_subnet.portfolio-public-subnet-1.id, aws_subnet.portfolio-private-subnet-2.id
  ]

  security_groups = [
    module.http_sg.security_group_id,
    module.https_sg.security_group_id,
    module.http_redirect_sg.security_group_id,
    module.redis_sg.security_group_id
  ]
}

module "http_sg" {
  source      = "./security_group"
  name        = "http-sg"
  vpc_id      = aws_vpc.portfolio-vpc.id
  port        = 80
  cidr_blocks = ["0.0.0.0/0"]
}

module "https_sg" {
  source      = "./security_group"
  name        = "https-sg"
  vpc_id      = aws_vpc.portfolio-vpc.id
  port        = 443
  cidr_blocks = ["0.0.0.0/0"]
}

module "http_redirect_sg" {
  source      = "./security_group"
  name        = "http-redirect-sg"
  vpc_id      = aws_vpc.portfolio-vpc.id
  port        = 8080
  cidr_blocks = ["0.0.0.0/0"]
}

data "aws_route53_zone" "portfolio-hostzone" { #ホストゾーンのデータソース定義
  name = "coffee-oma.com"
}

resource "aws_route53_record" "portfolio-record" { #ALBのDNSレコードの定義
  zone_id = data.aws_route53_zone.portfolio-hostzone.zone_id
  name    = data.aws_route53_zone.portfolio-hostzone.name
  type    = "A"

  alias {
    name                   = aws_lb.portfolio-lb.dns_name
    zone_id                = aws_lb.portfolio-lb.zone_id
    evaluate_target_health = true
  }
}

resource "aws_acm_certificate" "portfolio-acm" { #SSL証明書の定義
  domain_name               = aws_route53_record.portfolio-record.name
  subject_alternative_names = []
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "portfolio-certificate" { #SSL証明書の検証用レコードの定義
  for_each = {
    for dvo in aws_acm_certificate.portfolio-acm.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }
  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.portfolio-hostzone.zone_id
}

resource "aws_acm_certificate_validation" "portfolio-certificate-validation" { #SSL証明書の検証完了まで待機
  certificate_arn         = aws_acm_certificate.portfolio-acm.arn
  validation_record_fqdns = [for record in aws_route53_record.portfolio-certificate : record.fqdn]
}
resource "aws_lb_listener" "http" { #HTTPリスナーの定義
  load_balancer_arn = aws_lb.portfolio-lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "これは「HTTP」です"
      status_code  = "200"
    }
  }
}
resource "aws_lb_listener" "https" { #HTTPSリスナーの定義
  load_balancer_arn = aws_lb.portfolio-lb.arn
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = aws_acm_certificate.portfolio-acm.arn
  ssl_policy        = "ELBSecurityPolicy-2016-08"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "これは「HTTPS」です"
      status_code  = "200"
    }
  }
}

resource "aws_lb_listener" "redirect_http_to_https" { #HTTPからHTTPSにリダイレクトするリスナーの定義
  load_balancer_arn = aws_lb.portfolio-lb.arn
  port              = "8080"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_target_group" "portfolio-target-group-http" { #ターゲットグループの定義
  name                 = "portfolio-http"
  target_type          = "ip"
  vpc_id               = aws_vpc.portfolio-vpc.id
  port                 = 80
  protocol             = "HTTP"
  deregistration_delay = 300

  health_check {
    path                = "/"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 300
    matcher             = 200
    port                = "traffic-port"
    protocol            = "HTTP"
  }

  depends_on = [aws_lb.portfolio-lb]
}


resource "aws_lb_listener_rule" "portfolio-listener-rule-http" { #リスナールールの定義
  listener_arn = aws_lb_listener.http.arn
  priority     = 99

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.portfolio-target-group-http.arn
  }

  condition {
    path_pattern {
      values = ["/*"]
    }
  }
}


