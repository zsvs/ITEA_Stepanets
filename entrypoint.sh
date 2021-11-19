#!/bin/bash
mkdir 1

if [ $? == 0 ]
then
  echo "Starting nginx"
  search_str="%NM%"
  file="/usr/share/nginx/html/index.html"
  sed -i "s/$search_str/$NAME/gi" $file
  nginx -g "daemon off;"
fi