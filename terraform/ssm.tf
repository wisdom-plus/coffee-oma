resource "aws_ssm_parameter" "secret" {
  name = "var_file"
  type = "SecureString"
  value = var.env_file
}

resource "aws_ssm_parameter" "db" {
  name = "db_password"
  type = "SecureString"
  value = var.rds_password
}

resource "aws_secretsmanager_secret" "env_file" {
  name = "env_file"
}

resource "aws_secretsmanager_secret_version" "env_file" {
  secret_id = aws_secretsmanager_secret.env_file.id
  secret_string = var.env_file
}
