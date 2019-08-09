FROM php:5.6.3-fpm
MAINTAINER Sinan Turgut <mail@sinanturgut.com.tr>

RUN apt-get update \
    && apt-get install -y  --force-yes --no-install-recommends nano curl git wget zip unzip libpq-dev

RUN docker-php-ext-install mbstring bcmath pdo pdo_pgsql