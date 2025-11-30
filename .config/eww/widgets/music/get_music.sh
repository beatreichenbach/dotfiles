#!/bin/bash

status=$(playerctl status)
artist=$(playerctl metadata --format '{{ artist }}')
title=$(playerctl metadata --format '{{ title }}')
art=$(playerctl metadata --format '{{ mpris:artUrl }}')

length=$(playerctl metadata --format '{{ mpris:length }}')
pos=$(playerctl metadata --format '{{ position }}')

duration=$([-z "$length" ] && echo "$length" || echo "0")
position=$([-z "$pos" ] && echo "$pos" || echo "0")

data="
{
  \"status\": \"$status\",
  \"artist\": \"$artist\",
  \"title\": \"$title\",
  \"art\": \"$art\",
  \"duration\": \"$duration\",
  \"position\": \"$position\"
}
"

echo "$data"
