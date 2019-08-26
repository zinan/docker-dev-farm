FROM php:7.3-fpm
LABEL maintainer="Sinan Turgut <mail@sinanturgut.com.tr>"

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
RUN pecl install redis \
	&& pecl install xdebug \
	&& pecl install mongodb \
	&& docker-php-ext-enable redis xdebug mongodb

#docker-php-ext-enable [extension]

RUN apt install -y libgmp-dev \
	&& ln -s /usr/include/x86_64-linux-gnu/gmp.h /usr/include/gmp.h \
	&& docker-php-ext-install -j$(nproc) \
		gmp \
		bcmath

RUN docker-php-ext-install -j$(nproc) \
	soap \
	sockets \
	calendar \
	sysvmsg \
	sysvsem \
	sysvshm


#RUN pecl install -o -f redis && rm -rf /tmp/pear && docker-php-ext-enable redis

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
&& composer --version

# RUN echo "extension=mongodb.so" >> /usr/local/etc/php/conf.d/mongodb.ini
