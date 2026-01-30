#!/bin/bash
FIFO=/tmp/cava.fifo

if [ ! -p $FIFO ]; then
    mkfifo $FIFO
fi

# Start cava in background if not running, using waybar-specific config
if ! pgrep -f "cava.*config-waybar" > /dev/null; then
    cava -p ~/.config/cava/config-waybar &
fi

# Read from fifo and format for waybar
cat $FIFO | sed -u 's/;//g;s/0/ /g;s/1/▁/g;s/2/▂/g;s/3/▃/g;s/4/▄/g;s/5/▅/g;s/6/▆/g;s/7/▇/g;s/8/█/g'
