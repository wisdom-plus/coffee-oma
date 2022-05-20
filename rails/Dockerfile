FROM ruby:2.7.6-alpine3.15

WORKDIR /coffee-oma

ARG USER_ID="10000"
ARG GROUP_ID="10001"
ARG USER_NAME="rails"

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
                        yarn &&\
    apk add --virtual build-dependencies --no-cache build-base curl-dev &&\
    bundle install -j4 &&\
    apk del build-dependencies

COPY . .

RUN yarn install && yarn cache clean

EXPOSE 3000
