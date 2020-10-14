FROM ruby:2.7.2-alpine
LABEL maintainer="Namespace Inc."

RUN apk update \
 && apk upgrade --no-cache \
 && apk add --update --no-cache \
            alpine-sdk \
            bash \
            bind-tools \
            imagemagick \
            jq \
            less \
            libgcrypt-dev \
            libxml2-dev \
            libxslt-dev \
            mariadb-dev \
            mysql-client \
            --repository http://dl-cdn.alpinelinux.org/alpine/edge/main/ nodejs=12.18.2-r0 npm \
            yarn \
            tzdata \
            xvfb \
            ghostscript \
 && apk add --update --no-cache --virtual .build-dependencies \
            build-base \
            wget \
            yaml-dev \
            zlib-dev \
 && gem install -q -N bundler -v 2.1.4 \
 && gem install -q -N pkg-config \
 && gem install -q -N rails -v 6.0.3 \
 && gem install -q -N mysql2 -v 0.5.3 \
 && apk del .build-dependencies \
 && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem

