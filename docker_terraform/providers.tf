provider "aws" {
  region = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

terraform {
  required_version = "~> 1.0.2"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.38.0"
    }
  }
  backend "s3" {
    bucket = "terraform-portfolio-tfstate"
    key = "terraform.tfstate"
    encrypt = true
    region = "ap-northeast-1"
  }
}
