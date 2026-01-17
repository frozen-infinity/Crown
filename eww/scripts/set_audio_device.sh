#!/bin/bash

read sink

echo $sink

pactl set-default-sink $sink

for sream in $(pactl list short sink-inputs | awk '{print $1}') do
  pactl move-sink-input "$stream" $sink
done
