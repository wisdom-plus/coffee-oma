terraform {
  required_version = ">=0.13"
}

provider aws {
  version = "~> 3.13.0"
  region  = var.aws_region
}
