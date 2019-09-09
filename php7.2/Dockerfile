FROM php:7.2-fpm-alpine

ARG XDEBUG_HOST="127.0.0.1"
ARG XDEBUG_PORT=9001

RUN apk add --no-cache --update --virtual buildDeps libcurl curl curl-dev autoconf gcc make g++ zlib-dev libzip-dev postgresql-dev libxml2-dev libpng libpng-dev libjpeg-turbo-dev libwebp-dev zlib-dev libxpm-dev gd icu-dev libxslt libxslt-dev libmemcached libmemcached-dev

RUN docker-php-ext-install mbstring curl zip mysqli pdo pdo_pgsql pdo_mysql soap bcmath


RUN pecl install xdebug redis-4.0.1 mongodb
RUN docker-php-ext-enable redis xdebug mongodb
RUN apk del buildDeps

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
&& composer --version

RUN echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/xdebug.ini \
   && echo "xdebug.remote_autostart=1" >> /usr/local/etc/php/conf.d/xdebug.ini &&\
   echo "xdebug.remote_connect_back=1" >> /usr/local/etc/php/conf.d/xdebug.ini &&\
   echo "xdebug.remote_handler = dbgp" >> /usr/local/etc/php/conf.d/xdebug.ini &&\
   echo "xdebug.remote_mode = req" >> /usr/local/etc/php/conf.d/xdebug.ini &&\
   echo "xdebug.idekey='PHPSTORM'" >> /usr/local/etc/php/conf.d/xdebug.ini &&\
   echo "xdebug.remote_host=${XDEBUG_HOST}" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini &&\
   echo "xdebug.remote_port=${XDEBUG_PORT}" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

EXPOSE 9000