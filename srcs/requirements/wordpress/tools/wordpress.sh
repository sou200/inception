#!/bin/bash

sed -i 's!listen = /run/php/php7.4-fpm.sock!listen=wordpress:9000!g' /etc/php/7.4/fpm/pool.d/www.conf

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

mkdir /run/php

php-fpm7.4 -F
