SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$SQL_ROOT_PASSWORD');
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD' WITH GRANT OPTION;
DELETE FROM mysql.user WHERE user != 'root' AND user != 'mariadb.sys' OR (user = 'root' AND host != 'localhost');
CREATE DATABASE $SQL_DATABASE;
CREATE USER '$SQL_USER'@'%' IDENTIFIED by '$SQL_PASSWORD';
GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO $SQL_USER@'%';
FLUSH PRIVILEGES;

-- CREATE DATABASE '${SQL_DATABASE}';
-- CREATE USER '${SQL_USER}'@'%' IDENTIFIED by '${SQL_PASSWORD}';
-- -- SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$SQL_ROOT_PASSWORD');
-- -- GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD' WITH GRANT OPTION;
-- GRANT ALL PRIVILEGES ON *.* TO '${SQL_USER}'@'%';
-- ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';
-- -- DELETE FROM mysql.user WHERE user != 'root' AND user != 'mariadb.sys' OR (user = 'root' AND host != 'localhost');
-- FLUSH PRIVILEGES;

--  mysql -e "CREATE DATABASE IF NOT EXISTS '${SQL_DATABASE}';"
-- # mysql -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED by '${SQL_PASSWORD}' ;"
-- # # mysql -e "SET PASSWORD FOR 'nikki1'@'localhost' = PASSWORD ${SQL_ROOT_PASSWORD};"
-- # # mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY \ ${SQL_ROOT_PASSWORD} WITH GRANT OPTION;"
-- # # mysql -e "DELETE FROM mysql.user WHERE user != 'root' AND user != 'mariadb.sys' OR (user = 'root' AND host != 'localhost');"
-- # mysql -e "GRANT ALL PRIVILEGES ON '${SQL_NAME}'.* TO '${SQL_USER}' @'%';"
-- # mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
-- # mysql -e "FLUSH PRIVILEGES;"
-- # # mysql -e "CREATE USER IF NOT EXISTS `${SQL_USER}`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
-- # touch /var/lib/mysql/.setup
