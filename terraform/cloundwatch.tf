resource "aws_cloudwatch_event_rule" "stop-rule" {
  name                = "stop-rule"
  description          = "夜10時にサーバーを停止する"
  schedule_expression = var.scheduled_suspending.stop_schedule
}

resource "aws_cloudwatch_event_rule" "start-rule" {
  name                = "start-rule"
  description          = "朝10時にサーバーを開始する"
  schedule_expression = var.scheduled_suspending.start_schedule
}

resource "aws_cloudwatch_event_rule" "start-resource-rule" {
  name = "start-resource-rule"
  description = "朝９時にリソースを起動させる"
  schedule_expression = var.resource_scheduled
}

resource "aws_cloudwatch_event_target" "stop-target" {
  target_id = "StopDetabase"
  arn       = "arn:aws:ssm:ap-northeast-1::automation-definition/AWS-StopRdsInstance"
  rule      = aws_cloudwatch_event_rule.stop-rule.name
  role_arn  = module.cloudwatch_ssm_role.iam_role_arn
  input = data.template_file.input_file.rendered
}


resource "aws_cloudwatch_event_target" "start-target" {
  target_id = "StartDetabase"
  arn       = "arn:aws:ssm:ap-northeast-1::automation-definition/AWS-StartRdsInstance"
  rule      = aws_cloudwatch_event_rule.start-rule.name
  role_arn  = module.cloudwatch_ssm_role.iam_role_arn
  input = data.template_file.input_file.rendered
}

resource "aws_cloudwatch_event_target" "start-resource-target" {
  target_id = "start-resource-rule"
  arn = aws_ecs_cluster.terraform-cluster.arn
  rule = aws_cloudwatch_event_rule.start-resource-rule.name
  role_arn = module.cloudwatch_resource_role.iam_role_arn
  input = file("create-task.json")

  ecs_target {
    launch_type = "FARGATE"
    task_count = 1
    task_definition_arn = aws_ecs_task_definition.terraform-task.arn
    platform_version = "1.4.0"
    network_configuration {
      subnets = [aws_subnet.portfolio-private-subnet-1.id]
      security_groups = [module.nginx_sg.security_group_id, module.nginx_https_sg.security_group_id]
      assign_public_ip =  false
    }
  }
}


resource "aws_cloudwatch_event_target" "destroy-resource-target" {
  target_id = "destroy-resource-rule"
  arn = aws_ecs_cluster.terraform-cluster.arn
  rule = aws_cloudwatch_event_rule.stop-rule.name
  role_arn = module.cloudwatch_resource_role.iam_role_arn
  input = file("destroy-task.json")

  ecs_target {
    launch_type = "FARGATE"
    task_count = 1
    task_definition_arn = aws_ecs_task_definition.terraform-task.arn
    platform_version = "1.4.0"
    network_configuration {
      subnets = [aws_subnet.portfolio-private-subnet-1.id]
      security_groups = [module.nginx_sg.security_group_id, module.nginx_https_sg.security_group_id]
      assign_public_ip =  false
    }
  }
}
data "template_file" "input_file" {
  template = file("${path.module}/input.json")

  vars = {
    db-id    = aws_db_instance.portfolio-db.id
  }
}

module "cloudwatch_ssm_role" {
  source     = "./iam_role"
  name       = "cloudwatch-ssm-role"
  identifier = ["events.amazonaws.com","ssm.amazonaws.com","rds.amazonaws.com"]
  policy     = data.aws_iam_policy_document.allow_rds.json
}

data "aws_iam_policy_document" "allow_rds" {
  statement {
    effect = "Allow"
    actions = ["rds:StopDBInstance",
      "rds:StartDBInstance",
    "rds:DescribeDBInstances",
    "ssm:*"]
    resources = ["*"]
  }
}

module "cloudwatch_resource_role" {
  source = "./iam_role"
  name = "cloudwatch-resource-role"
  identifier = ["events.amazonaws.com","ssm.amazonaws.com"]
  policy     = data.aws_iam_policy_document.allow_resource.json
}

data "aws_iam_policy_document" "allow_resource" {
    statement {
    effect = "Allow"
    actions = ["ssm:*"]
    resources = ["*"]
  }
}
