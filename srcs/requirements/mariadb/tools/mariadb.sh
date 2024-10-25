#!/bin/bash
service mariadb start
mariadb -e "CREATE USER '$DBUSER'@'%' IDENTIFIED BY '$DBPASS';"
mariadb -e "GRANT ALL PRIVILEGES ON *. * TO '$DBUSER'@'%';"
mariadb -e "FLUSH PRIVILEGES;"
sleep 1
service mariadb stop
mariadbd