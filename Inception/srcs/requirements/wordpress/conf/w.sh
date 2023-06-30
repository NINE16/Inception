#!/bin/bash
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


	#Inport env variables in the config file
	sed -i "s/username_here/$SQL_USER/g" wp-config-sample.php
	sed -i "s/password_here/$SQL_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/$SQL_HOSTNAME/g" wp-config-sample.php
	sed -i "s/database_name_here/$SQL_DATABASE/g" wp-config-sample.php
	cp wp-config-sample.php wp-config.php
	if [ $? == 0 ] ; then
		echo -e "\t\033[32m WP OK 033[0m"
	  else
		echo -e "\t\033[31m WP failed\033[0m"
	  fi
fi
# if /run/php folder does not exist, create it
if [ ! -d /run/php ]; then
    mkdir -p /run/php
fi
/usr/sbin/php-fpm7.3 -F

exec "$@"
