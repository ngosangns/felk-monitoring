#!/bin/bash
# Script tự động cài đặt WordPress khi container lần đầu chạy

set -e

WP_PATH=/var/www/html

if [ ! -f "$WP_PATH/wp-config.php" ]; then
  echo "Downloading WordPress..."
  curl -o /tmp/latest.tar.gz https://wordpress.org/latest.tar.gz
  tar -xzf /tmp/latest.tar.gz -C /tmp
  cp -r /tmp/wordpress/* $WP_PATH/
  rm -rf /tmp/wordpress /tmp/latest.tar.gz

  echo "Setting permissions..."
  chown -R www-data:www-data $WP_PATH

  echo "Generating wp-config.php..."
  cp $WP_PATH/wp-config-sample.php $WP_PATH/wp-config.php
  sed -i "s/database_name_here/${WORDPRESS_DB_NAME}/" $WP_PATH/wp-config.php
  sed -i "s/username_here/${WORDPRESS_DB_USER}/" $WP_PATH/wp-config.php
  sed -i "s/password_here/${WORDPRESS_DB_PASSWORD}/" $WP_PATH/wp-config.php
  sed -i "s/localhost/${WORDPRESS_DB_HOST}/" $WP_PATH/wp-config.php

  echo "WordPress downloaded and configured."
else
  echo "WordPress already installed."
fi
