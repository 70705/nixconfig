#!/bin/sh
/etc/nixos/software/i3/scripts/i3-scratch-list  | rofi -dmenu -i -p "" -theme /etc/nixos/software/i3/rofi/launcher.rasi | perl -nE 'my($id) = split("-");  $id =~ tr/ //d; if($id){say $id}' | xargs -i{} i3-msg "[id=\""{}"\"] scratchpad show"
