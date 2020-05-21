#!/bin/bash

sites="/var/www/yoursite.tld/images \
       /var/www/yourothersite.tld/content/images \
       /var/www/yourthirdsite.tld/wp-content/uploads"

for site in $sites; do
# convert png created in the last 24 hours to webp
{
find "$site" -ctime 0 -type f -iname "*.png" -print0 | xargs -0 -I {}  \
bash -c '[ ! -f "{}.webp" ] && { cwebp -q 9 -mt {} -o {}.webp; }' >> /var/log/webp-cron.log 2>&1
# convert jpg created in the last 24 hours to webp
find "$site" -ctime 0 -type f \( -iname "*.jpg" -o -iname "*.jpeg" \) -print0 | xargs -0 -I {} \
bash -c '[ ! -f "{}.webp" ] && { cwebp -q 82 -mt {} -o {}.webp; }'
} >> /var/log/webp-cron.log 2>&1
done

