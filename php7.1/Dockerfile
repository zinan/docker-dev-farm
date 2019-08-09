FROM php:7.1-fpm
MAINTAINER Sinan Turgut <mail@sinanturgut.com.tr>

RUN apt-get update \
    && apt install -y --no-install-recommends nano curl debconf git apt-transport-https apt-utils \
    build-essential locales acl mailutils wget zip unzip


RUN apt-get install -y libpq-dev \
    && docker-php-ext-install mbstring bcmath pdo pdo_pgsql pdo_mysql

RUN apt-get install -y \
	libxml2-dev \
	libxslt-dev \
	&& docker-php-ext-install -j$(nproc) \
		dom \
		xmlrpc \
		xsl

# PECL
RUN pecl install xdebug-2.6.0 \
	&& pecl install mongodb-1.5.5 \
	&& docker-php-ext-enable xdebug mongodb

#RUN echo "extension=mongodb.so" >> /usr/local/etc/php/conf.d/mongodb.ini

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
&& composer --version