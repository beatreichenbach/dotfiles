#!/bin/bash

# kill the daemon to force a restart
eww kill &> /dev/null

# start the daemon if it's not running
eww state &> /dev/null || eww daemon

# open up the bar for every monitor
monitors=$(swaymsg -t get_outputs | jq -r '.[].name')
for monitor in ${monitors}; do
    eww open bar_${monitor}
done