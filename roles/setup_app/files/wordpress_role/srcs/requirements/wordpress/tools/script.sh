#!/bin/bash

cd /var/www
wp core download --allow-root
wp config create --allow-root --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=$DB_HOST:$DB_HOST_PORT --path=$WP_PATH
wp core install --url=$DOMAIN_NAME --title='TACHKOUN 7NA' --admin_user=$DB_USER --admin_password=$ADMIN_PASS --admin_email=$ADMIN_EMAIL --allow-root --path=$WP_PATH
wp user create $USER1 $USER1_EMAIL --role=$ROLE1 --allow-root --path=$WP_PATH --user_pass=$USER1_PASS

php-fpm7.3 -F
