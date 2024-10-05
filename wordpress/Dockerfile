FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y php-fpm \
    ca-certificates && \
    apt-get clean

ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /usr/bin/wp

RUN chmod +x /usr/bin/wp && \
    mkdir -p /var/www/html

