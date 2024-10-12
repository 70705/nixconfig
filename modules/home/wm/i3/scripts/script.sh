#!/bin/sh
/etc/nixos/modules/home/wm/i3/scripts/i3-scratch-list  | rofi -dmenu -i -p "" -theme /etc/nixos/modules/home/wm/i3/rofi/launcher.rasi | perl -nE 'my($id) = split("-");  $id =~ tr/ //d; if($id){say $id}' | xargs -i{} i3-msg "[id=\""{}"\"] scratchpad show"
