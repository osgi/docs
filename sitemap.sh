#!/bin/bash

# url configuration
URL="https://docs.osgi.org/"

# begin new sitemap
exec 1> sitemap.xml

# print head
echo '<?xml version="1.0" encoding="UTF-8"?>'
echo '<urlset xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"'
echo '  xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd"'
echo '  xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">'

# print urls
IFS=$'\r\n' GLOBIGNORE='*' command eval "OPTIONS=($(cat $0.options))"
find specification javadoc download/r*/* -type f "${OPTIONS[@]}" -print | \
while read -r FILE; do
  echo "  <url>"
  echo "   <loc>${URL}${FILE}</loc>"
  echo "  </url>"
done

# print foot
echo "</urlset>"
