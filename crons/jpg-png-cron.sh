#!/bin/bash


sites="/var/www/yoursite.tld/images \
       /var/www/yourothersite.tld/content/images \
       /var/www/yourthirdsite.tld/wp-content/uploads"

for site in $sites; do
  # optimize jpg images created in the last 24 hours
  find "$site" -ctime 0 -type f \( -iname "*.jpg" -o -iname "*.jpeg" \) -print0 | xargs -0 jpegoptim --preserve --strip-all -m82 >> /var/log/jpg-png-cron.log 2>&1
  # optimize png images created in the last 24 hours
  find "$site" -ctime 0 -type f  -iname '*.png' -print0 | xargs -0 optipng -o7 -strip all  >> /var/log/jpg-png-cron.log 2>&1
done