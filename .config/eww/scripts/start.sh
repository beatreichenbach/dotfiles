#!/bin/bash

eww kill

monitors=$(swaymsg -t get_outputs | jq -r '.[].name')

for monitor in ${monitors}; doew
    eww open bar_${monitor}
done