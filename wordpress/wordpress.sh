#!/bin/bash

mkdir -p /var/www/html/


wp core download --path=/var/www/html/ --allow-root

sleep 1

wp config create --path=/var/www/html/ \
                    --dbname="$DBNAME" \
                    --dbuser="$DBUSER" \
                    --dbpass="$DBPASS" \
                    --dbhost="$DBHOST" \
                    --allow-root

sleep 1

wp core install --path=/var/www/html/ \
                --url="$WP_URL" \
                --title="$WP_TITLE" \
                --admin_user="$WP_ADMIN" \
                --admin_password="$WP_PASS" \
                --allow-root

php7.4-fpm -F

# bash