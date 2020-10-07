FROM ruby:2.7.1
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update && apt-get install -y --no-install-recommends \
  build-essential \
  libpq-dev \
  node.js \
  chromium-driver \
  yarn \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
ENV APP_NAME coffee
WORKDIR /$APP_NAME
COPY ./Gemfile /$APP_NAME/Gemfile
COPY ./Gemfile.lock /$APP_NAME/Gemfile.lock
RUN bundle install --jobs=4
COPY . /$APP_name
EXPOSE 3000

