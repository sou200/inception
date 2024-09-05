FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y php-fpm tar libpng-dev && \
    apt-get clean

WORKDIR /var/www/html

ADD https://wordpress.org/latest.tar.gz .
RUN tar -xzf latest.tar.gz && \
    rm latest.tar.gz

CMD ["php-fpm"]