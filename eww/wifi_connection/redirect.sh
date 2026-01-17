#!/bin/bash

name=$(<~/.config/eww/wifi_menu/wifi-name.txt)

echo $name

pkill eww

#iwctl device wlan0 set-property Powered on
iwctl station wlan0 scan
iwctl station wlan0 connect $name --passphrase "${1}"

network=$(iwctl station wlan0 show | awk -F' ' ' /Connected network    / {print $3}')

if [[ "$network" == "$name" ]]; then
  echo $name >>~/.config/wifi/known_networks
fi
