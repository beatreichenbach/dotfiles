#!/bin/bash

status=$(playerctl status)
artist=$(playerctl metadata --format '{{ artist }}')
title=$(playerctl metadata --format '{{ title }}')
art=$(playerctl metadata --format '{{ mpris:artUrl }}')

# mpris:length is in microseconds
length=$(playerctl metadata --format '{{ mpris:length }}')
# position is in seconds but format is in microseconds
position=$(playerctl position --format '{{ position }}')

duration=$( [[ -n "$length" ]] && echo $(( $length / 1000000 )) || echo 0 )
percentage=$( [[ -n "$position" && -n "$length" ]] && echo $(( $position * 100 / $length )) || echo 0 )

data="
{
  \"status\": \"$status\",
  \"artist\": \"$artist\",
  \"title\": \"$title\",
  \"art\": \"$art\",
  \"duration\": \"$duration\",
  \"position\": \"$percentage\"
}
"

echo "$data"
