#!/bin/bash

wp core download --path=/var/www/wordpress/ --allow-root

sleep 5

cd /var/www/wordpress/

wp config create --path=/var/www/wordpress/ \
                    --dbname="$DBNAME" \
                    --dbuser="$DBUSER" \
                    --dbpass="$DBPASS" \
                    --dbhost="$DBHOST" \
                    --allow-root

mariadb -u$DBUSER -p$DBPASS -h$DBHOST -e "CREATE DATABASE IF NOT EXISTS $DBNAME;"

wp core install --path=/var/www/wordpress/ \
                --url="$WP_URL" \
                --title="$WP_TITLE" \
                --admin_user="$WP_ADMIN" \
                --admin_password="$WP_ADMIN_PASS" \
                --admin_email="$WP_ADMIN_EMAIL" \
                --allow-root

wp user create $WP_USER $WP_USER_EMAIL \
                --role=author \
                --user_pass=$WP_USER_PASS \
                --path=/var/www/wordpress \
                --allow-root

mkdir /run/php

php-fpm7.4 -F
