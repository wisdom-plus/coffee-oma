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
COPY custom.conf /etc/nginx/conf.d
EXPOSE 80
