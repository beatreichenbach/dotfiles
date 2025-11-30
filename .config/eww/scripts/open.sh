#!/bin/bash

monitor=$(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name')
windows=$(eww windows)
window=$1
open_window=$(echo "$windows" | grep "*pop_${window}_${monitor}" | sed s'/*//')

if [[ -n "$open_window" ]]; then
    # if window is already open, close it
    eww close "$open_window"
else
    # close all windows with names starting with "pop_"
    eww close $(echo "$windows" | grep "*pop_" | sed s'/*//')

    # find window name for focused monitor and open it
    target_window=$(echo "$windows" | grep "pop_${window}_${monitor}")
    [[ -n "$target_window" ]] && eww open "$target_window"
fi