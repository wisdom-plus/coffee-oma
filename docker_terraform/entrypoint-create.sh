#!/bin/sh
set -e

echo "$TFVAR_FILE" | base64 -d >terraform.tfvars

terraform init

terraform apply --target=aws_ecr_repository.test -auto-approve

exec "$@"
