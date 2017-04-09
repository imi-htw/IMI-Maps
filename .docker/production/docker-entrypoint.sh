#!/usr/bin/env bash
set -eo pipefail
echo "Production entrypoint"

# test if postgresql is up
while ! nc -z postgresql 5432; do sleep 1; done

cd /usr/src/app \
  && bundle exec rake db:migrate \
  && bundle exec rake db:seed
exec "$@"
