#!/bin/bash

wp core download --path=/var/www/wordpress/ --allow-root

sleep 5

if [ ! -d /var/www/wordpress ]; then
    mkdir /var/www/wordpress/
fi

cd /var/www/wordpress/

wp config create --dbname="$DBNAME" \
                    --dbuser="$DBUSER" \
                    --dbpass="$DBPASS" \
                    --dbhost="$DBHOST" \
                    --allow-root

mariadb -u$DBUSER -p$DBPASS -h$DBHOST -e "CREATE DATABASE IF NOT EXISTS $DBNAME;"

wp core install --url="$WP_URL" \
                --title="$WP_TITLE" \
                --admin_user="$WP_ADMIN" \
                --admin_password="$WP_ADMIN_PASS" \
                --admin_email="$WP_ADMIN_EMAIL" \
                --allow-root

wp user create $WP_USER $WP_USER_EMAIL \
                --role=author \
                --user_pass=$WP_USER_PASS \
                --allow-root

                # --path=/var/www/wordpress \
mkdir /run/php

php-fpm7.4 -F
