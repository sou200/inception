FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    wordpress php \
    php7.4-fpm \
    php-mysql \
    mariadb-client \
    ca-certificates && \
    apt-get clean 

ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /usr/bin/wp

COPY ./tools/wordpress.sh .
COPY conf /etc/php/7.4/fpm/pool.d/www.conf

RUN chmod +x /usr/bin/wp && \
    chmod +x ./wordpress.sh

RUN mkdir /var/www/wordpress/

EXPOSE 9000

ENTRYPOINT ["./wordpress.sh"]