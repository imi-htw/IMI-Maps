#!/usr/bin/env bash
set -ex
cd /usr/src/app \
  && bundle exec rake db:migrate \
  && bundle exec rake db:seed
exec "$@"
