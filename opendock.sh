#!/bin/bash

x=$(niri msg -j windows | jq -e '.[] | select(.title == "peaclockcandy")')

if [[ "$x" != "" ]]; then
  pkill kittyterminal
  exit 0
fi

kittyterminal --title "peaclockcandy" peaclock &
kittyterminal --title "cmatrixcandy" cmatrix &
kittyterminal --title "pipescandy" pipes.sh &
kittyterminal --title "sfetchcandy" ~/arch.sh &
kittyterminal --title "btopcandy" btop -t -p 3
