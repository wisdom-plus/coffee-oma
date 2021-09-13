#!/bin/sh
set -e

echo "$TFVAR_FILE" | base64 -d >terraform.tfvars

terraform init

terraform apply --target=aws_elasticache_replication_group.portfolio-replication-group -auto-approve

exec "$@"
