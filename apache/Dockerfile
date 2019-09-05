FROM debian:jessie
LABEL maintainer="Sinan Turgut <mail@sinanturgut.com.tr>"

RUN apt-get update && apt-get install -y nano unzip wget curl

RUN apt-get update && apt-get install -y apache2 && apt-get clean

RUN a2enmod proxy_http && a2enmod rewrite && a2enmod proxy_fcgi

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

EXPOSE 80
ENTRYPOINT ["/usr/sbin/apache2ctl"]
CMD ["-D", "FOREGROUND"]