#!/bin/bash
service mariadb start
sleep 2
mariadb -e "CREATE USER '$DBUSER'@'%' IDENTIFIED BY '$DBPASS';"
mariadb -e "GRANT ALL PRIVILEGES ON *. * TO '$DBUSER'@'%';"
mariadb -e "FLUSH PRIVILEGES;"
sleep 2
service mariadb stop
sleep 2
mariadbd
