#!/bin/bash

if [ ! -d "/var/lib/mysql/mysql" ]; then
	echo "Initializing MariaDB data directory..."
	mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

cat << EOF > /tmp/init.sql
CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;
CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO '${DB_USER}'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';
FLUSH PRIVILEGES;
EOF

exec mysqld --user=mysql --bind-address=0.0.0.0 --init-file=/tmp/init.sql
