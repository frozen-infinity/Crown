#!/bin/bash

mapfile -t pn < <(pactl -f json list sinks | jq -r '.[].description')

mapfile -t n < <(pactl list short sinks | while read -r line; do
  echo "$line" | awk '{ print $2 }'
done)

monitor=0

echo $monitor

echo "(
    defwindow audio_menu
    :monitor \"$monitor\"
    :exclusive \"false\"
    :stacking \"overlay\"
    :geometry
    (geometry :y \"60px\"
              :width \"300px\"
              :x \"1500px\")
    (audio_menu)
)

(
    defwidget audio_menu []
    (
        box :class \"parent\" :space-evenly \"false\" :orientation \"v\"
        (
            box :class \"body\" :space-evenly \"false\" :orientation \"v\"" >~/.config/eww/eww.yuck

for ((i = 0; i < ${#pn[@]}; i++)); do
  echo "            (
                button 
                :class \"button\"
                :vexpand \"false\"
                :onclick \"pactl set-default-sink ${n[$i]} ; eww open audio_menu --toggle ; eww open slider --toggle --config ~/.config/eww/test/
\"
                (label :text \"  ${pn[$i]}\")
            )" >>~/.config/eww/eww.yuck
done

echo "        )
    )
)
" >>~/.config/eww/eww.yuck

eww open slider --toggle --config ~/.config/eww/test/

eww open audio_menu --toggle
