wp core download --path=/var/www/html/ --allow-root

wp core install --url=$WP_URL \
                --title=$WP_TITLE \
                --admin_user=$WP_ADMIN \
                --admin_password=$WP_PASS \
                --allow-root

wp config create --dbname=$WP_DBNAME \
                    --dbuser=$WP_DBUSER \
                    --dbpass=$WP_DBPASS \
                    --dbhost=$WP_DBHOST \
                    --allow-root