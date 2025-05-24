#!/bin/sh

service mysql start

cat << EOF > /usr/local/bin/cr_db.sql

CREATE DATABASE $DB_NAME;
CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';
GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
FLUSH PRIVILEGES;
EOF
#echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '1337';" >> /usr/local/bin/cr_db.sql


mysql < /usr/local/bin/cr_db.sql
#mysql -u root -p1337 -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'wordpress'; flush privileges;"

kill $(cat /var/run/mysqld/mysqld.pid)
