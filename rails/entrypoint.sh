#!/bin/sh
set -e

echo "$ENV_FILE" | base64 -d >.env

bundle exec rails assets:precompile RAILS_ENV=production

bin/rails db:migrate RAILS_ENV=production

RAILS_ENV=production bin/delayed_job start

rails sitemap:refresh

exec "$@"
