FROM	debian:buster-slim

RUN		apt-get update -y && apt-get upgrade -y && apt-get install nginx vim -y

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
