#!/bin/sh
set -e

echo "$ENV_FILE" | base64 -d >.env

bin/rails db:migrate RAILS_ENV=production

whenever --update-crontab

crond start

RAILS_ENV=production bin/delayed_job -n 2 start

exec "$@"
