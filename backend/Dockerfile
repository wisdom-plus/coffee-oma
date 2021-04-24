FROM ruby:2.7.2-alpine

WORKDIR /coffee-oam

COPY Gemfile Gemfile.lock  ./

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
                        imagemagick \
                        yarn &&\
    apk add --virtual build-dependencies --no-cache build-base curl-dev &&\
    bundle install -j4 &&\
    apk del build-dependencies

COPY . .

EXPOSE 3001
