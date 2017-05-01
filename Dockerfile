# start from the resin rpi-raspbian image
FROM fastberry/apachephpmysqlbase:latest
MAINTAINER fastberrypi@gmail.com

# no need to install anything as the base image has all we need

# now set the mysql root password
# RUN mysqladmin -u root password fastberry

COPY src/index.html /var/www/html/index.html
COPY src/index.php /var/www/html/index.php
COPY src/mysqltest.php /var/www/html/mysqltest.php

# copy the startup script for mysql
ADD src/start_mysql.sh /usr/bin/start_mysql.sh
ADD src/start_apache.sh /usr/bin/start_apache.sh
ADD src/start_lamp.sh /usr/bin/start_lamp.sh

# start the services using our start-up script
CMD ["/usr/bin/start_lamp.sh"]


