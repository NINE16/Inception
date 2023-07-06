#!/bin/sh

mysql_install_db

/etc/init.d/mysql start

echo "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE; GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD'; FLUSH PRIVILEGES;" | mysql -u root

/etc/init.d/mysql stop

exec "$@"
