resource "aws_cloudwatch_event_rule" "stop-rule" {
  name                = "stop-rule"
  description          = "夜10時にサーバーを停止する"
  schedule_expression = var.scheduled_suspending.stop_schedule
}

resource "aws_cloudwatch_event_rule" "start-rule" {
  name                = "start-rule"
  description          = "朝９時にサーバーを開始する"
  schedule_expression = var.scheduled_suspending.start_schedule
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
