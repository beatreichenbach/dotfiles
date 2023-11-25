#!/bin/bash

status=$(playerctl status)
artist=$(playerctl metadata --format '{{ artist }}')
title=$(playerctl metadata --format '{{ title }}')
art=$(playerctl metadata --format '{{ mpris:artUrl }}')

duration=$(playerctl metadata --format '{{ mpris:length }}')
position=$(playerctl metadata --format '{{ position }}')

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
