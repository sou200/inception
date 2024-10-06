FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y php-fpm \
    mariadb-client \
    ca-certificates && \
    apt-get clean

ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /usr/bin/wp

COPY ./wordpress.sh .

RUN chmod +x /usr/bin/wp && \
    chmod +x ./wordpress.sh

CMD ["./wordpress.sh"]