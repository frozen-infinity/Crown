#!/bin/bash

read sink

pactl set-default-sink $sink

for stream in $(pactl list short sink-inputs | awk '{print $1}'); do
    pactl move-sink-input "$stream" $sink
done
