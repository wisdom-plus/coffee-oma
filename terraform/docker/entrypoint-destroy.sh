#!/bin/sh
set -e

echo "$TFVAR_FILE" | base64 -d >.terraform.tfvars

terraform init

terraform destory

exec "$@"
