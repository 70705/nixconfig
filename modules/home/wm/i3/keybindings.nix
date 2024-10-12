{ 
  config,
  lib,
  ... 
}:
{
      
      xsession.windowManager.i3.config.keybindings = let
        modifier = config.xsession.windowManager.i3.config.modifier;
      in lib.mkForce {
          "Print" = "exec --no-startup-id /etc/nixos/modules/home/wm/i3/scripts/screenshot.sh";
          "${modifier}+q" = "kill";
          "${modifier}+space" = "exec --no-startup-id rofi -terminal wezterm -show drun -theme /etc/nixos/modules/home/wm/i3/rofi/launcher.rasi";
          "${modifier}+h" = "exec --no-startup-id /etc/nixos/modules/home/wm/i3/scripts/script.sh";
          "${modifier}+v" = "move scratchpad";
          "${modifier}+s" = "floating toggle";
          "${modifier}+Return" = "exec --no-startup-id wezterm";
          "XF86AudioRaiseVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10% && $refresh_i3status";
          "XF86AudioLowerVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -10% && $refresh_i3status";
          "XF86AudioMute" = "exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && $refresh_i3status";
          "XF86AudioPlay" = "exec playerctl play-pause";
          "XF86AudioPrev" = "exec playerctl previous";
          "XF86AudioNext" = "exec playerctl next";
          "Insert" = "exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle && $refresh_i3status";
          "${modifier}+Left" = "focus left";
          "${modifier}+Up" = "focus up";
          "${modifier}+Right" = "focus right";
          "${modifier}+Down" = "focus down";
          "${modifier}+Shift+Left" = "move left";
          "${modifier}+Shift+Down" = "move down";
          "${modifier}+Shift+Up" = "move up";
          "${modifier}+Shift+Right" = "move right";
          "${modifier}+f" = "fullscreen toggle";
          "${modifier}+Alt+1" = "exec --no-startup-id kill picom";
          "${modifier}+Alt+2" = "exec --no-startup-id picom &";
          "${modifier}+1" = "workspace number 1";
          "${modifier}+2" = "workspace number 2";
          "${modifier}+3" = "workspace number 3";
          "${modifier}+4" = "workspace number 4";
          "${modifier}+5" = "workspace number 5";
          "${modifier}+6" = "workspace number 6";
          "${modifier}+7" = "workspace number 7";
          "${modifier}+8" = "workspace number 8";
          "${modifier}+9" = "workspace number 9";
          "${modifier}+0" = "workspace number 10";
          "${modifier}+Shift+1" = "move container to workspace number 1";
          "${modifier}+Shift+2" = "move container to workspace number 2";
          "${modifier}+Shift+3" = "move container to workspace number 3";
          "${modifier}+Shift+4" = "move container to workspace number 4";
          "${modifier}+Shift+5" = "move container to workspace number 5";
          "${modifier}+Shift+6" = "move container to workspace number 6";
          "${modifier}+Shift+7" = "move container to workspace number 7";
          "${modifier}+Shift+8" = "move container to workspace number 8";
          "${modifier}+Shift+9" = "move container to workspace number 9";
          "${modifier}+Shift+0" = "move container to workspace number 10";
          "${modifier}+Shift+c" = "reload";
          "${modifier}+Shift+r" = "restart";
  };
}
