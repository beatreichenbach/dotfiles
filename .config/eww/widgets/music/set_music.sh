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
fi
