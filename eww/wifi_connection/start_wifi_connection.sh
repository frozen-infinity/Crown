#!/bin/bash

monitor=`hyprctl monitors -j | jq -r '.[] | select(.focused) | .name'`

echo $monitor

if [ "$monitor" = "HDMI-A-1" ]; then
  echo '(
  defwindow password_field
    :monitor 1
    :exclusive "false"
    :stacking "overlay"
    :wm-ignore false
    :focusable true
    :geometry
    (geometry :y "10px"
              :width "300px"
              :x "1420px")
    (password_field)
)
(defwidget password_field []
  (box
    :orientation "vertical"
    :spacing 5
    (input
      :single-line true
      :onaccept "./redirect.sh \"$0\" ; pkill eww"
    )
  )
)' > ~/.config/eww/wifi_connection/eww.yuck
fi

if [ "$monitor" = "eDP-2" ]; then
    echo '(
  defwindow password_field
    :monitor 0
    :exclusive "false"
    :stacking "overlay"
    :wm-ignore false
    :focusable true
    :geometry
    (geometry :y "10px"
              :width "300px"
              :x "1420px")
    (password_field)
)
(defwidget password_field []
  (box
    :orientation "vertical"
    :spacing 5
    (input
      :single-line true
      :onaccept "./redirect.sh \"$0\" ; pkill eww"
    )
  )
)' > ~/.config/eww/wifi_connection/eww.yuck
fi

eww open password_field --toggle --config ~/.config/eww/wifi_connection/
