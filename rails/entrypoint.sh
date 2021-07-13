#!/bin/sh
set -e

echo "$ENV_FILE" | base64 -d >.env

bin/rails db:migrate:reset RAILS_ENV=production

bin/rails db:seed RAILS_ENV=production

RAILS_ENV=production bin/delayed_job -n 2 start

whenever -i

exec "$@"
