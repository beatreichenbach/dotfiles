#!/bin/bash

while getopts ":m:" opt; do
  case $opt in
    m)
      master_volume=$OPTARG
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

if [ -n "$master_volume" ]; then
  amixer -D pulse sset Master "$master_volume%"
else
  echo "Usage: $0 -m <master_volume>"
  exit 1
fi