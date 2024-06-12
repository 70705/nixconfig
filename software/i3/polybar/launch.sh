#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar1 and bar2
polybar --config=/etc/nixos/software/i3/polybar/config.ini | tee -a /tmp/polybar1.log & disown

