#!/bin/bash

s=$(sudo adguardvpn-cli status)

read -r first _ <<< "$s"
if [[ "$first" == "Connected" ]]; then
  sudo adguardvpn-cli disconnect
  notify-send "AdGuard VPN" "VPN disconnected"
else
  sudo adguardvpn-cli connect
  notify-send "AdGuard VPN" "VPN connected"
fi
