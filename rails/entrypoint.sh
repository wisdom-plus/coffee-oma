#!/bin/bash
set -e

echo "$ENV_FILE" | base64 --decode >.env

bundle exec rails assets:precompile RAILS_ENV=production

bin/rails db:migrate RAILS_ENV=production

exec "$@"
