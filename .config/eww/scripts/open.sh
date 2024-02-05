#!/bin/bash

window=$1
monitor=$(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name')

open_window=$(eww active-windows | grep "pop_${window}_${monitor}" | cut -d':' -f1)

if [[ -n "$open_window" ]]; then
    # if window is already open, close it
    eww close "$open_window"
else
    # close all other popup windows
    eww close $(eww active-windows | grep "pop_" | cut -d':' -f1)

    # find window name for focused monitor and open it
    target_window=$(eww list-windows | grep "pop_${window}_${monitor}")
    [[ -n "$target_window" ]] && eww open "$target_window"
fi