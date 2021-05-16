#!/bin/bash

echo "list /var/www/HomeWorkPHP.com=========="
ls -lai /var/www/HomeWorkPHP.com

if [ $? == 0 ]
then
  chown -R $USER:$USER /var/www/HomeWorkPHP.com

  nginx -t

  echo "Starting nginx"
  nginx -g "daemon off;"
fi