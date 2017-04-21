#!/bin/bash
echo "Starting services"
/usr/bin/start_mysql.sh
/usr/bin/start_apache.sh

echo "Services should be running"
echo
echo "Check for apache"
ps -elf | grep apache
echo
echo "Check for MySQL"
ps -elf | grep mysql
echo "MySQL Version: "
mysql --version
mysql -u root -e "select user,host from mysql.user;"

# run a bash shell
/bin/bash -i


