# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adbaich <adbaich@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/03/14 11:24:44 by adbaich           #+#    #+#              #
#    Updated: 2023/04/06 17:45:32 by adbaich          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	debian:buster-slim

ARG	DB_NAME \
	DB_USER \
	DB_PASS \
	MYSQL_ROOT_PASSWORD

RUN		apt-get update -y && apt-get upgrade -y && apt-get install -y mariadb-server vim

COPY     ./requirements/mariadb/tools/script.sh   /usr/local/bin/script.sh

EXPOSE	3306

RUN	/usr/local/bin/script.sh

CMD	["mysqld", "--bind-address=0.0.0.0"]
