#!/bin/bash

swww img -t outer --transition-pos 0.2,1.0 --transition-step 25 ~/Wallpapers/$1.png &
sleep 2.5
pkill swaybg
swaybg --image ~/Wallpapers/$1-blurred.jpg &
if [[ "$1" == "1" ]]; then
  ~/theme.sh 2
elif [[ "$1" == "7" ]]; then
  ~/theme.sh 7
else
  ~/theme.sh 1
fi
