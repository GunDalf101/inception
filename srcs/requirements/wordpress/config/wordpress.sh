#!/bin/bash

sleep 10

cd /var/www/wordpress

wp config create --dbhost=$DB_HOST --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --path=/var/www/wordpress --allow-root

wp core install --title=$WP_TITLE \
				--admin_user=$WP_ADMIN_USER \
				--admin_password=$WP_ADMIN_PASSWORD \
				--admin_email=$WP_ADMIN_MAIL \
				--url=$WP_URL \
				--path=/var/www/wordpress \
				--allow-root

wp user create $WP_USER $WP_USER_MAIL --role=author --user_pass=$WP_USER_PASSWORD --path=/var/www/wordpress --allow-root

wp config set WP_REDIS_HOST 'redis' --type=constant --add --allow-root

wp config set WP_REDIS_PORT '6379' --type=constant --add --allow-root

wp plugin install redis-cache --activate --allow-root

# chown -R www-data:www-data /wordpress

wp --allow-root redis enable

cd -

php-fpm7.4 -F