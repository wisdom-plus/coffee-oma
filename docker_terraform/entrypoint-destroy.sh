#!/bin/sh
set -e

echo "$TFVAR_FILE" | base64 -d >terraform.tfvars

terraform init

terraform destroy -target=aws_elasticache_replication_group.portfolio-replication-group -target=aws_vpc_endpoint.s3 -target=aws_vpc_endpoint.dkr -target=aws_vpc_endpoint.ecr-api -target=aws_vpc_endpoint.logs -target=aws_vpc_endpoint.email-smtp -auto-approve

exec "$@"
