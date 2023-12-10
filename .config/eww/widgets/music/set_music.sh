#!/bin/bash

if [[ "$1" == "play" ]]; then
	playerctl play
elif [[ "$1" == "pause" ]]; then
	playerctl pause
elif [[ "$1" == "play-pause" ]]; then
	playerctl play-pause
elif [[ "$1" == "next" ]]; then
	playerctl next
elif [[ "$1" == "previous" ]]; then
	playerctl previous
elif [[ "$1" == "position" ]]; then
  length=$(playerctl metadata --format '{{ mpris:length }}')
	playerctl position $(( $2 * ($length / 1000000) / 100 ))
fi
