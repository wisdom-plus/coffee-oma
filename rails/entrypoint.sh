#!/bin/bash
set -e

bin/rails db:migrate RAILS_ENV=production

exec "$@"
