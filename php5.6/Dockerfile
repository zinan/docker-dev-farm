FROM php:5.6-fpm-alpine

ARG XDEBUG_HOST="127.0.0.1"
ARG XDEBUG_PORT=9001
ENV COMPOSER_HOME=/root/.composer

RUN apk add --no-cache --update --virtual buildDeps libcurl curl curl-dev autoconf gcc make g++ zlib-dev libzip-dev postgresql-dev libxml2-dev libpng libpng-dev libjpeg-turbo-dev libwebp-dev zlib-dev libxpm-dev gd icu-dev libxslt libxslt-dev libmemcached libmemcached-dev

RUN docker-php-ext-install mysql curl zip mysqli pdo pdo_pgsql pdo_mysql soap exif gd mbstring intl xsl mysql bcmath sockets


RUN pecl install mongo && echo "extension=mongo.so" >> /usr/local/etc/php/conf.d/mongodb.ini
RUN pecl install memcached-2.2.0
RUN pecl install xdebug-2.5.5
RUN docker-php-ext-enable xdebug
RUN apk del buildDeps


RUN mkdir -p $COMPOSER_HOME \
&& curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
&& composer --version

RUN echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/xdebug.ini \
   && echo "xdebug.remote_autostart=1" >> /usr/local/etc/php/conf.d/xdebug.ini &&\
   echo "xdebug.remote_connect_back=1" >> /usr/local/etc/php/conf.d/xdebug.ini &&\
   echo "xdebug.remote_handler = dbgp" >> /usr/local/etc/php/conf.d/xdebug.ini &&\
   echo "xdebug.remote_mode = req" >> /usr/local/etc/php/conf.d/xdebug.ini &&\
   echo "xdebug.idekey='PHPSTORM'" >> /usr/local/etc/php/conf.d/xdebug.ini &&\
   echo "xdebug.remote_host=${XDEBUG_HOST}" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini &&\
   echo "xdebug.remote_port=${XDEBUG_PORT}" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini && \
   echo "extension=mongo.so" >> /usr/local/etc/php/conf.d/mongodb.ini

EXPOSE 9000