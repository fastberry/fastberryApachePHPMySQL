#!/bin/bash

echo "Starting MYSQL server..."

# start and pipe stdout and stderr to file
/usr/bin/mysqld_safe > /etc/mysql/mysqlconsole 2>&1 &

# wait until MySQL server has started, up to 30 seconds
timeout=30
    echo -n "Waiting for MySQL server to start and accept connections..."
    while ! /usr/bin/mysqladmin -u root status >/dev/null 2>&1
    do
      timeout=$(($timeout - 1))
      if [ $timeout -eq 0 ]; then
        echo -e "\nCould not connect to database server. Aborting..."
        exit 1
      fi
      echo -n "."
      sleep 1
    done
    echo

# give fastberry user all access to all tables
mysql -u root -e "CREATE USER 'fastberry'@'localhost' IDENTIFIED BY 'pi';"
mysql -u root -e "GRANT ALL PRIVILEGES on *.* TO 'fastberry'@'localhost' IDENTIFIED BY '' WITH GRANT OPTION;"
mysql -u root -e "FLUSH PRIVILEGES"





