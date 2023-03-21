#!/bin/bash

URL='https://duckduckgo.com/?q='
QUERY=$(echo '' | fuzzel -d -p "Search: " <<< !w: wikipedia!) 
if [ -n "$QUERY" ]; then
  xdg-open "${URL}${QUERY}" 2> /dev/null
fi
