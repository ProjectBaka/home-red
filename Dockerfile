FROM ruby:3.2.0-buster

WORKDIR /app
ENV RAILS_LOG_TO_STDOUT="1" \
    RAILS_SERVE_STATIC_FILES="true" \
    RAILS_ENV="production" \
    SECRET_KEY_BASE="smh"

RUN apt update && apt install libpq-dev

COPY Gemfile /app
COPY Gemfile.lock /app

RUN BUNDLE_IGNORE_FUNDING_REQUESTS=1 bundle install

COPY . /app

RUN SECRET_KEY_BASE_DUMMY=1 bundle exec rails assets:precompile
RUN chmod 655 build/docker-entrypoint.sh

EXPOSE 3000
CMD ["build/docker-entrypoint.sh"]
