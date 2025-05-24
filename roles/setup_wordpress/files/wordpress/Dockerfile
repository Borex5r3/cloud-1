FROM	debian:buster-slim

ARG	DB_NAME \
	DB_USER \
	DB_PASS \
	WP_PATH \
	DOMAIN_NAME \
	ADMIN_PASS \
	ADMIN_EMAIL \
	USER1 \
	USER1_EMAIL \
	ROLE1 \
	USER1_PASS \
	DB_HOST \

COPY	./requirements/wordpress/conf/sources.list	/etc/apt/sources.list

RUN	apt-get update && apt-get upgrade -y 
RUN	apt-get install vim php-cgi php-common php-fpm php-pear php-mbstring php-zip php-net-socket php-gd php-xml-util php-gettext php-mysql php-bcmath curl mariadb-client -y

RUN mkdir -p /var/www /run/php

COPY    ./requirements/wordpress/conf/www.conf  /etc/php/7.3/fpm/pool.d/www.conf

COPY	./requirements/wordpress/tools/script.sh	/usr/local/bin/script.sh

RUN     curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

EXPOSE	9000

CMD	["bash", "/usr/local/bin/script.sh"]
