#!/bin/bash

echo "Starting Apache"
/usr/sbin/apache2ctl -D FOREGROUND > /etc/apache2/apacheconsole 2>&1 &
