# syntax=docker/dockerfile:1
# check=error=true

ARG RUBY_VERSION=3.4.5-slim-trixie
FROM docker.io/library/ruby:$RUBY_VERSION AS base

ARG RAILS_ENV=development
ARG DATABASE_HOST=postgres
ENV RAILS_ENV="${RAILS_ENV}" \
    DATABASE_HOST="${DATABASE_HOST}"

WORKDIR /good-night

# Install base packages
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y curl libjemalloc2 vim && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives


# Throw-away build stage to reduce size of final image
FROM base AS build

# Install packages needed to build gems
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential libpq-dev libyaml-dev pkg-config && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

# Install application gems
COPY Gemfile Gemfile.lock ./
RUN gem install bundler:2.7.1 \
    && bundle config set --local without 'development test' \
    && bundle install \
    && apt-get remove -qq -y --purge libpq-dev \
    && apt-get autoremove -qq -y \
    && apt-get clean -qq -y \
    && rm -rf ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git \
    && bundle exec bootsnap precompile --gemfile

# Copy application code
COPY . .

# Precompile bootsnap code for faster boot times
RUN bundle exec bootsnap precompile app/ lib/

EXPOSE 3000

ENTRYPOINT ["bundle", "exec"]
CMD ["puma", "-C", "config/puma.rb"]