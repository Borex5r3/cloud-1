# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adbaich <adbaich@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/03/03 11:25:01 by adbaich           #+#    #+#              #
#    Updated: 2023/03/21 12:59:04 by adbaich          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	debian:buster-slim

RUN		apt-get update -y && apt-get upgrade -y && apt-get install nginx vim -y

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
