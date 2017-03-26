FROM ruby:2.1-alpine

ENV APP_HOME /usr/src/app
ENV RAILS_ENV development
ENV RACK_ENV development

# run seeds

EXPOSE 80

WORKDIR $APP_HOME

COPY Gemfile* $APP_HOME/
COPY .docker/development/docker-entrypoint.sh /

# general dependencies
RUN set -ex \
  && apk add --no-cache libpq imagemagick nodejs bash

# build deps
RUN set -ex \
  && apk add --no-cache --virtual .builddeps linux-headers libpq build-base postgresql-dev imagemagick-dev \
  && bundle install --without test \
  && apk del .builddeps

#ADD . $APP_HOME

# add .dockerignore
# run migrations
#RUN set -ex \
  #&& bundle exec rake db:migrate

ENTRYPOINT ["/docker-entrypoint.sh"]


CMD ["bundle", "exec", "unicorn", "--port", "80"]

# USER nobody
# chown -R nobody $APP_HOME
