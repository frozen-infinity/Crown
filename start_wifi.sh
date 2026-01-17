#!/bin/bash

mapfile -t n < <(nmcli -t -f SSID dev wifi | sort -u | sed '/^$/d')

echo "(
    defwindow wifi_menu
    :monitor 0
    :exclusive \"false\"
    :stacking \"overlay\"
    :geometry
    (geometry :y \"10px\"
              :width \"300px\"
              :x \"1520px\")
    (wifi_menu)
)

(
    defwidget wifi_menu []
    (
        box :class \"parent\" :space-evenly \"false\" :orientation \"v\"
        (
            box :class \"header\" :space-evenly \"false\"
            (label :text \"     Select WiFi network\" :class \"title\")
            (
                button 
                :class \"exit\" 
                :onclick \"eww open wifi_menu --toggle --config ~/.config/eww/wifi_menu/\"
                (label :text \"
                 \")
            )
        )
        (
            box :class \"body\" :space-evenly \"false\" :orientation \"v\"" >~/.config/eww/wifi_menu/eww.yuck

for ((i = 0; i < ${#n[@]}; i++)); do
  echo "            (
                button 
                :class \"button\"
                :vexpand \"false\"
                :onclick \"scripts/ignite.sh ${n[$i]}\"
                (label :text \"  ${n[$i]}\")
            )" >>~/.config/eww/wifi_menu/eww.yuck
done

echo "        )
    )
)
" >>~/.config/eww/wifi_menu/eww.yuck

eww open wifi_menu --toggle --config ~/.config/eww/wifi_menu/
