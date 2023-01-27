FROM ruby:3.2.0-alpine AS builder
RUN apk add --no-cache \
build-base \
libpq-dev
COPY Gemfile* ./
COPY Rakefile* ./
COPY config/ ./
RUN bundle install
RUN #rake assets:precompile

FROM ruby:3.2.0-alpine AS runner
WORKDIR /app
# We copy over the entire gems directory for our builder image, containing the already built artifact
COPY --from=builder /usr/local/bundle/ /usr/local/bundle/
COPY . .

RUN rails test

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
FROM ruby:3.2.0-alpine

