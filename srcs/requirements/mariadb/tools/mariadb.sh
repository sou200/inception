#!/bin/bash
service mariadb start
mariadb -e "CREATE USER IF NOT EXISTS '$DBUSER'@'%' IDENTIFIED BY '$DBPASS';"
mariadb -e "CREATE DATABASE IF NOT EXISTS $DBNAME;"
mariadb -e "GRANT ALL PRIVILEGES ON *. * TO '$DBUSER'@'%';"
sleep 1
service mariadb stop
mariadbd
