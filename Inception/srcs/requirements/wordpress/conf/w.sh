#!/bin/bash
set -x
sleep 5
if [ -f ./wp-config.php ]
then
	echo "wordpress already downloaded"
else
	#Download wordpress and all config file
	wget http://wordpress.org/latest.tar.gz
	tar xfz latest.tar.gz
	mv wordpress/* /var/www/html
	rm -rf latest.tar.gz
	rm -rf wordpress
	chown -R www-data:www-data /var/www/
	chmod -R 755 /var/www/html/

	wp config create	--allow-root \
						--dbname=$SQL_DATABASE \
						--dbuser=$SQL_ADMIN_USR \
						--dbpass=$SQL_ADMIN_PWS \
						--dbhost=$SQL_HOSTNAME --path='/var/www/html'
	wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --allow-root
	wp user create $SQL_USER $SQL_USER_MAIL --user_pass=$SQL_PASSWORD --role=author --allow-root
	wp theme install inspiro --activate --allow-root
fi
# if /run/php folder does not exist, create it
if [ ! -d /run/php ]; then
    mkdir -p /run/php
fi
/usr/sbin/php-fpm7.3 -F

exec "$@"