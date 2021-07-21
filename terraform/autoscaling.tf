resource "aws_appautoscaling_target" "ecs-main" {
  max_capacity       = var.ecs_task_desired_count
  min_capacity       = var.ecs_task_desired_count
  resource_id        = var.resource_id
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}

resource "aws_appautoscaling_scheduled_action" "ecs-main-stop" {
  name               = "${var.application_env_name}-stop"
  service_namespace  = aws_appautoscaling_target.ecs-main.service_namespace
  resource_id        = aws_appautoscaling_target.ecs-main.resource_id
  scalable_dimension = aws_appautoscaling_target.ecs-main.scalable_dimension
  scalable_target_action {
    min_capacity = 0
    max_capacity = 0
  }
  schedule = var.scheduled_suspending.stop_schedule
  depends_on = [aws_appautoscaling_target.ecs-main]
}

resource "aws_appautoscaling_scheduled_action" "ecs-main-start" {
  name               = "${var.application_env_name}-start"
  service_namespace  = aws_appautoscaling_target.ecs-main.service_namespace
  resource_id        = aws_appautoscaling_target.ecs-main.resource_id
  scalable_dimension = aws_appautoscaling_target.ecs-main.scalable_dimension
  scalable_target_action {
    min_capacity = var.ecs_task_desired_count
    max_capacity = var.ecs_task_desired_count
  }
  schedule = var.scheduled_suspending.start_schedule
  depends_on = [aws_appautoscaling_target.ecs-main]
}

