#!/bin/bash

if [[ ! `pidof eww` ]]; then
	eww daemon
	sleep 1
fi

eww kill

monitors=$(swaymsg -t get_outputs | jq -r '.[].name')

for monitor in ${monitors}; do
    eww open bar_${monitor}
done