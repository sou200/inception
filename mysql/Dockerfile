FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y wget php-fpm tar libpng-dev && \
    apt-get clean

RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz && \
    rm latest.tar.gz

CMD ["php-fpm", "-F"]