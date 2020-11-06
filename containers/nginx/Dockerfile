FROM nginx:1.19.4
RUN apt-get update && \
  apt-get install -y --no-install-recommends apt-utils \
  locales && \
  sed -i -e 's/# ja_JP.UTF-8/ja_JP.UTF-8/g' /etc/locale.gen && \
  locale-gen ja_JP.UTF-8 \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
ENV LANG ja_JP.UTF-8
ENV LC_TIME C
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./conf.d/default.conf /etc/nginx/conf.d/default.conf
