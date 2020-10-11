#!/bin/sh

mkdir -p tmp/pids
rm -f tmp/pids/server.pid

bundle install

bundle exec rake assets:precompile
bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails db:seed

if [[ "$PROMETHEUS_EXPORTER" == 1 ]]; then
  bundle exec prometheus_exporter prometheus_exporter -p 9394 -b 0.0.0.0 &
fi

bundle exec rails s -b 0.0.0.0
