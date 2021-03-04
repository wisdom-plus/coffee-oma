FROM ruby:2.7.1-alpine

WORKDIR /coffee-oma

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
                        yarn &&\
    apk add --virtual build-dependencies --no-cache build-base curl-dev &&\
    bundle install -j4 &&\
    apk del build-dependencies

COPY . .

RUN yarn install && yarn cache clean

EXPOSE 3000
