FROM php:5.6.3-fpm
LABEL maintainer="Sinan Turgut <mail@sinanturgut.com.tr>"

ENV COMPOSER_HOME=/root/.composer

RUN apt-get update \
    && apt-get install -q -y  --force-yes --no-install-recommends nano curl git wget zip unzip libpq-dev

RUN apt-get install -y --force-yes \
        libssl-dev libxslt1-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev zlib1g-dev libicu-dev g++ \
        && docker-php-ext-configure intl && docker-php-ext-install intl \
    && docker-php-ext-install  iconv mcrypt \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install  gd

RUN docker-php-ext-install exif gd mbstring intl xsl zip mysqli pdo pdo_pgsql pdo_mysql soap bcmath sockets

RUN pecl install mongodb && echo "extension=mongodb.so" >> /usr/local/etc/php/conf.d/mongodb.ini

RUN mkdir -p $COMPOSER_HOME \
&& curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
&& composer --version

RUN usermod -u 1000 www-data
CMD php-fpm
EXPOSE 9000