#!/bin/sh
/etc/nixos/system/i3config/i3-scratch-list  | rofi -dmenu -i -p "" -theme /etc/nixos/system/i3config/rofi/launcher.rasi | perl -nE 'my($id) = split("-");  $id =~ tr/ //d; if($id){say $id}' | xargs -i{} i3-msg "[id=\""{}"\"] scratchpad show"
