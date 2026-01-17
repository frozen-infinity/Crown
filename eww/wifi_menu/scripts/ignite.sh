#!/bin/bash

echo $1 >wifi-name.txt

#readarray -t wifi_list < <(nmcli -t -f NAME,TYPE connection show | grep ":wifi" | cut -d: -f1)
#wifi_list=$(iwctl known-networks list)
mapfile -t wifi_list <~/.config/wifi/known_networks

for wifi in "${wifi_list[@]}"; do
  if [ "$wifi" = "$1" ]; then
    iwctl station wlan0 connect "$1"
    exit
  fi
done

eww open wifi_menu --toggle --config ~/.config/eww/wifi_menu/
eww open password_field --toggle --config ~/.config/eww/wifi_connection/
