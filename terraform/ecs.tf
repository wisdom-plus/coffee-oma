resource "aws_ecr_repository" "rails" {
  name = "portfolio-rails"
}

resource "aws_ecr_repository" "nginx" {
  name = "portfolio-nginx"
}

resource "aws_ecs_cluster" "portfolio-ecs" { #ECSクラスタの定義
  name = "portfolio-cluster"
}

resource "aws_ecs_task_definition" "portfolio-ecs-task-rails" { #タスク定義
  family                   = "portfolio-service"
  cpu                      = "512"
  memory                   = "1024"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  container_definitions    = file("./task/rails_container_definitions.json")
  execution_role_arn       = module.ecs_task_execution_role.iam_role_arn
}

resource "aws_ecs_task_definition" "portfolio-ecs-task-db" { #タスク定義
  family                   = "portfolio-service"
  cpu                      = "512"
  memory                   = "1024"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  container_definitions    = file("./task/rails_db_create_container_definitions.json")
  execution_role_arn       = module.ecs_task_execution_role.iam_role_arn
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
    security_groups  = [module.nginx_sg.security_group_id, module.nginx_https_sg.security_group_id]

    subnets = [
      aws_subnet.portfolio-private-subnet-1.id
    ]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.portfolio-target-group-http.arn
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

module "nginx_https_sg" {
  source      = "./security_group"
  name        = "nginx-https-sg"
  vpc_id      = aws_vpc.portfolio-vpc.id
  port        = 443
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

data "aws_iam_policy" "ecs_task_execution_role_policy" { #ポリシーの参照
  arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

data "aws_iam_policy_document" "ecs_task_execution" { #ポリシードキュメントの定義
  source_json = data.aws_iam_policy.ecs_task_execution_role_policy.policy

  statement {
    effect    = "Allow"
    actions   = ["ssm:GetParameters", "kms:Decrypt"]
    resources = ["*"]
  }
}

module "ecs_task_execution_role" { #IAMロールの定義
  source     = "./iam_role"
  name       = "ecs-task-execution"
  identifier = "ecs-tasks.amazonaws.com"
  policy     = data.aws_iam_policy_document.ecs_task_execution.json
}
