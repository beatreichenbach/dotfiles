#!/bin/bash

master=$(amixer -D pulse sget Master | grep 'Left:' | awk -F'[][]' '{ print $2 }' | tr -d '%')

data="
{
  \"master\": \"$master\"
}
"

echo "$data"