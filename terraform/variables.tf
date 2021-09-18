variable "aws_region" {}

variable "aws_access_key" {}

variable "aws_secret_key" {}

variable "rds_user_name" {}
variable "rds_password" {}
variable "env_file" {}
variable "rails_image" {}
variable "nginx_image" {}

variable "tfvar_file" {}


variable "application_env_name" {
  type        = string
}

variable "scheduled_suspending" {
  description = "定期停止の設定"
  type = object({
    enable         = bool
    stop_schedule  = string
    start_schedule = string
  })
  default = {
    enable         = false
    stop_schedule  = "invalid"
    start_schedule = "invalid"
  }
}

variable "resource_scheduled" {}
variable "resource_destroy_scheduled" {}

variable "resource_id" {
  type        = string
  description = "サービスの名前"
}

variable "ecs_task_desired_count" {
  type        = number
  description = "ecsタスクの数"
}
