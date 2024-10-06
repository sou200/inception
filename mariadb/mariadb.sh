#!/bin/bash
service mariadb start
sleep 2
mariadb -e "CREATE USER '$DBUSER'@'%' IDENTIFIED BY '$DBPASS';"
mariadb -e "GRANT ALL PRIVILEGES ON *. * TO '$DBUSER'@'%';"
mariadb -e "FLUSH PRIVILEGES;"
service mariadb stop
mariadbd
