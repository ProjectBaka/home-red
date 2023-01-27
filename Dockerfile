FROM ruby:3.2.0-alpine AS builder
RUN apk update && apk add --no-cache build-base libpq-dev postgresql-dev libc-dev
COPY Gemfile* ./
COPY Rakefile* ./
COPY config/ ./
RUN BUNDLE_IGNORE_FUNDING_REQUESTS=1 bundle install
RUN #rake assets:precompile

FROM ruby:3.2.0-alpine AS runner
WORKDIR /app
RUN apk update && apk add --no-cache libpq-dev

# We copy over the entire gems directory for our builder image, containing the already built artifact
COPY --from=builder /usr/local/bundle/ /usr/local/bundle/
COPY . .

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
FROM ruby:3.2.0-alpine

