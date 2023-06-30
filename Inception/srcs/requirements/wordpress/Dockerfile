FROM debian:buster

RUN apt update -y && apt upgrade -y
RUN apt-get -y install wget
RUN apt-get install -y \
php7.3 \
php7.3-fpm \
php7.3-mysql \
php7.3-phar \
php7.3-json \
php7.3-xml \
php7.3-mbstring \
php7.3-curl \
php7.3-gd \
php7.3-intl \
php7.3-zip \
mariadb-client

EXPOSE 9000

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
RUN useradd http

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY conf/w.sh /w.sh
RUN chmod +x /w.sh

RUN	mkdir /run/php

WORKDIR /var/www/html

# RUN chown -R www-data:www-data /var/www/
# RUN chmod -R 755 /var/www/html

ENTRYPOINT ["sh", "/w.sh"]

# CMD ["/usr/sbin/php-fpm7.3", "-F"]

