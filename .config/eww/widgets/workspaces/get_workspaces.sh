#!/bin/bash

function get_workspaces() {
    echo $(swaymsg -t get_workspaces)
}

get_workspaces
swaymsg -t subscribe '["workspace"]' --monitor | {
    while read -r event; do
        get_workspaces
    done
}
