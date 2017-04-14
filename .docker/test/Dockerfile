FROM ruby:2.1-alpine

ENV APP_HOME /usr/src/app
ENV RAILS_ENV test
ENV RACK_ENV test

EXPOSE 80

WORKDIR $APP_HOME

COPY Gemfile* $APP_HOME/
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

# general dependencies
RUN set -ex \
  && apk add --no-cache libpq imagemagick nodejs bash

ADD . $APP_HOME

# build deps
RUN set -ex \
  && apk add --no-cache --virtual .builddeps linux-headers libpq build-base postgresql-dev imagemagick-dev libffi-dev \
  && bundle install \
  && apk del .builddeps


ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["bundle", "exec", "rake", "db:migrate"]
