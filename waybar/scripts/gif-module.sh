#!/usr/bin/env bash
DIR="$HOME/.config/waybar/mygif"
mapfile -t FRAMES < <(find "$DIR" -type f -name '*.png' | sort)

DELAY=0.08

# print first frame immediately
printf '{"text":"<span><img src=\\"%s\\"/></span>"}\n' "${FRAMES[0]}"
sleep "$DELAY"

while true; do
  for f in "${FRAMES[@]}"; do
    printf '{"text":"<span><img src=\\"%s\\"/></span>"}\n' "$f"
    sleep "$DELAY"
  done
done
