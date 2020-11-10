resource "aws_ecr_repository" "rails" {
  name = "portfolio-rails"
}

resource "aws_ecr_repository" "nginx" {
  name = "portfolio-nginx"
}

resource "aws_ecs_cluster" "portfolio-ecs" { #ECSクラスタの定義
  name = "portfolio-cluster"
}

resource "aws_ecs_task_definition" "portfolio-ecs-task" { #タスク定義
  family                   = "portfolio-service"
  cpu                      = "512"
  memory                   = "1024"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  container_definitions    = file("./container_definitions.json")
  execution_role_arn       = aws_iam_role.ecs_task.arn
}

resource "aws_ecs_service" "portfolio-ecs-service" { #ECSサービスの定義
  name                              = "portfolio-service"
  cluster                           = aws_ecs_cluster.portfolio-ecs.arn
  task_definition                   = aws_ecs_task_definition.portfolio-ecs-task.arn
  desired_count                     = 1
  launch_type                       = "FARGATE"
  platform_version                  = "1.4.0"
  health_check_grace_period_seconds = 60

  network_configuration {
    assign_public_ip = false
    security_groups  = [module.nginx_sg.security_group_id]

    subnets = [
      aws_subnet.portfolio-private-subnet-1.id, aws_subnet.portfolio-private-subnet-2.id
    ]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.portfolio-target-group.arn
    container_name   = "nginx"
    container_port   = 80
  }

  lifecycle {
    ignore_changes = [task_definition]
  }
}

module "nginx_sg" {
  source      = "./security_group"
  name        = "nginx-sg"
  vpc_id      = aws_vpc.portfolio-vpc.id
  port        = 80
  cidr_blocks = [aws_vpc.portfolio-vpc.cidr_block]
}

resource "aws_cloudwatch_log_group" "for_ecs_rails" { #cloudwatch logの定義
  name              = "/ecs/rails"
  retention_in_days = 30
}

resource "aws_cloudwatch_log_group" "for_ecs_nginx" { #cloudwatch logの定義
  name              = "/ecs/nginx"
  retention_in_days = 30
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ecs_task" {
  name               = "MyEcsTaskRole"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "ecs_task" {
  role       = aws_iam_role.ecs_task.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}
