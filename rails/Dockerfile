FROM ruby:3.2.2-alpine3.18

WORKDIR /coffee-oma

ARG USER_ID="10000"
ARG GROUP_ID="10001"
ARG USER_NAME="rails"
ARG GOBIN="/usr/local/bin"

RUN addgroup -S -g "${GROUP_ID}" "${USER_NAME}" && \
  adduser -u "${USER_ID}" -G "${USER_NAME}" -D "${USER_NAME}"

COPY Gemfile Gemfile.lock package.json yarn.lock ./

RUN apk  --no-cache add linux-headers\
                        libxml2-dev\
                        make\
                        gcc\
                        libc-dev\
                        nodejs\
                        tzdata\
                        mysql-client \
                        mysql-dev \
                        git \
                        less \
                        curl \
                        coreutils \
                        gnupg \
                        imagemagick \
                        graphviz \
                        tmux \
                        go \
                        yarn &&\
    apk add --virtual build-dependencies --no-cache build-base curl-dev &&\
    gem install bundler --no-document --version 2.3.26 && \
    bundle install -j4 &&\
    go install github.com/DarthSim/overmind/v2@v2.4.0 &&\
    apk del build-dependencies

COPY . .

RUN yarn install && yarn cache clean

EXPOSE 3000
