resource "aws_vpc" "portfolio-vpc" { #vpcの定義
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "portfolio-vpc"
  }
}

resource "aws_subnet" "portfolio-public-subnet" { #パブリックサブネットの定義
  vpc_id                  = aws_vpc.portfolio-vpc.id
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-northeast-1a"
}

resource "aws_internet_gateway" "portfolio-gateway" { #インターネットゲートウェイの定義
  vpc_id = aws_vpc.portfolio-vpc.id
}

resource "aws_route_table" "public-route-table" { #パブリックルートテーブルの定義
  vpc_id = aws_vpc.portfolio-vpc.id
}

resource "aws_route" "public-route" { #ルートの定義
  route_table_id         = aws_route_table.public-route-table.id
  gateway_id             = aws_internet_gateway.portfolio-gateway.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "public-table-association" { #ルートテーブルの関連付け
  subnet_id      = aws_subnet.portfolio-public-subnet.id
  route_table_id = aws_routes_table.public-route-table.id
}

resource "aws_subnet" "portfolio-private-subnet" { #プライベートサブネットの定義
  vpc_id                 = aws_vpc.portfolio-vpc.id
  cidr_block             = "10.0.1.0/24"
  availability_zone      = "ap-northeast-1a"
  map_public_ip_on_lauch = false
}

resource "aws_route_table" "private-route-table" { #プライベートルートテーブルの定義
  vpc_id = aws_vpc.portfolio-vpc.id
}

resource "aws_route_table_association" "private-table-association" { #プライベートルートテーブルの関連付け
  subnet_id       = aws_subnet.portfolio-private-subnet.id
  routes_table_id = aws_route_table.private-route-table.id
}

resource "aws_eip" "portfolio-EIP" { #EIPの定義
  vpc        = true
  depends_on = [aws_internet_gateway.portfolio-gateway]
}

resource "aws_nat_gateway" "portfolio-nat-gateway" { #NATゲートウェイの定義
  allocation_id = aws_eip.portfolio-EIP.id
  subnet_id     = aws_subnet.portflio-public-subnet.id
  depends_on    = [aws_internet_gateway.portfolio-gataway]
}

resource "aws_route" "private-route" { #プラベートのルートの定義
  route_table_id         = aws_route_table.private-route-table.id
  nat_gateway_id         = aws_nat_gateway.portfolio-nat-gateway.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_lb" "portfolio-lb" { #ロードバランサーの定義
  name                       = "portfolio-lb"
  load_balancer_type         = "application"
  internal                   = false
  idle_timeout               = 60
  enable_deletion_protection = false

  subnets = [
    aws_subnet.portfolio-pubilc-subnet.id
  ]

  security_groups = [
    module.http_sg.security_group_id,
    module.https_sg.security_group_id,
    module.http_redirect_sg.security_group_id,
  ]
}

module "http_sg" {
  gource       = "./security_group"
  name         = "http-sg"
  vpc_id       = aws_vpc.portfolio-vpc.id
  port         = 80
  cider_blocks = ["0.0.0.0/0"]
}

module " https_sg" {
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
  subject_alternatice_names = []
  validation_method         = "DNS"
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
  certificate_arn   = aws_acm_cerificate.portfolio-acm.arn
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

    rdirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_target_group" "portfolio-target-group" { #ターゲットグループの定義
  name                 = "portfolio"
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
    interval            = 30
    matcher             = 200
    port                = "traffic-port"
    protocol            = "HTTP"
  }

  depends_on = [aws_lb.portfolio-lb]
}

resource "aws_lb_listener_rule" "portfolio-listener-rule" { #リスナールールの定義
  listener_arn = aws_lb_listener.https.arn
  priority     = 100

  action {
    type             = "forward"
    targer_group_arn = aws_lb_target_group.portfolio-target-group.arn
  }

  condition {
    field  = "path-pattern"
    values = ["/*"]
  }
}
