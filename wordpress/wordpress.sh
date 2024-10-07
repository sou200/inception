#!/bin/bash

# mkdir -p /var/www/html/

wp core download --path=/var/www/html/ --allow-root

sleep 5

cd /var/www/html/
chown -R www-data:www-data /var/www/html/

wp config create --path=/var/www/html/ \
                    --dbname="$DBNAME" \
                    --dbuser="$DBUSER" \
                    --dbpass="$DBPASS" \
                    --dbhost="$DBHOST" \
                    --allow-root

mariadb -u$DBUSER -p$DBPASS -h$DBHOST -e "CREATE DATABASE $DBNAME;"

wp core install --path=/var/www/html/ \
                --url="$WP_URL" \
                --title="$WP_TITLE" \
                --admin_user="$WP_ADMIN" \
                --admin_password="$WP_PASS" \
                --admin_email="$WP_ADMIN_EMAIL" \
                --skip-email \
                --allow-root

mkdir /run/php

php-fpm7.4 -F

tail -f /dev/null
# bash