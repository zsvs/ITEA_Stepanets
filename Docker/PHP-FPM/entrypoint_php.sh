#!/usr/bin/bash
  #search_str="/run/php/php7.4-fpm.sock"
  #replace_str="127.0.0.1:80"
  #file="/etc/php/7.4/fpm/pool.d/www.conf"
  #sed -i "s/$search_str/$replace_str/" $file
mkdir 1
if [ $? == 0 ]
then
  nginx -t


  echo "+++++++++++++++++CHEKING nginx+++++++++++++++++++++++++"
  ls -la /etc/nginx/conf.d/
  echo "++++++++++++++++++++++++++++++++++++++++++"

  cat /etc/nginx/sites-enabled/default

  echo "++++++++++++++++++++++++++++++++++++++++++"

  cat /etc/php/7.4/fpm/pool.d/www.conf | grep listen

  echo "+++++++++++++++CHEKING PHP-FPM STATUS++++++++++++++++++++"

  service php7.4-fpm start
  service php7.4-fpm status

  echo "++++++++++++++++++++++++++++++++++++++++++"

  echo "Starting nginx"
  nginx -g "daemon off;"
fi