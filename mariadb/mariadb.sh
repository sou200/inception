#!/bin/sh
service mariadb start
sleep 2
mariadb -e "CREATE USER '$DBUSER'@'localhost' IDENTIFIED BY '$DBPASS';"
mariadb -e "GRANT ALL PRIVILEGES ON *. * TO '$DBUSER'@'localhost';"
mariadb -e "FLUSH PRIVILEGES;"
service mariadb stop
mariadbd
