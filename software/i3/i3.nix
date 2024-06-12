{ config,
  pkgs,
  lib,
  ... 
}:

{


  xsession.windowManager.i3 = {
    enable = true;

    config = {
      
      bars = [];
      modifier = "Mod4";
      terminal = "kitty";
      floating.titlebar = false;

      assigns = {
        "1" = [{class="Vivaldi-stable";}];
        "2" = [{class="vesktop";} {class="steam";}];
      };

      gaps = {
        smartBorders = "on";
      };

      window = {
        hideEdgeBorders = "smart";
        border = 3;
        titlebar = false;

        commands = [
          {
            command = "move scratchpad";
            criteria = {
              class = "com-azefsw-audioconnect-desktop-app-MainKt";
            };
          }

          {
            command = "floating enable";
            criteria = {
              class = "Pavucontrol";
            };
          }

          {
            command = "floating enable";
            criteria = {
              class = "Pcmanfm";
            };
          }
        ];
      };

      startup = [
        { command = "/etc/nixos/software/i3/polybar/launch.sh"; always = true; notification = false; }
        { command = "setroot -z /etc/nixos/software/i3/wallpaper.png"; always = true; notification = false; }
        { command = "autotiling"; always = true; notification = false; }
        { command = "AudioRelay"; always = true; notification = false; }
      ];

      
      keybindings = let
        modifier = config.xsession.windowManager.i3.config.modifier;
      in lib.mkForce {
          "Print" = "exec --no-startup-id /etc/nixos/software/i3/scripts/screenshot.sh";
          "${modifier}+q" = "kill";
          "${modifier}+space" = "exec --no-startup-id rofi -show drun -theme /etc/nixos/software/i3/rofi/launcher.rasi";
          "${modifier}+h" = "exec --no-startup-id /etc/nixos/software/i3/scripts/script.sh";
          "${modifier}+v" = "move scratchpad";
          "${modifier}+s" = "floating toggle";
          "${modifier}+Return" = "exec --no-startup-id kitty";
          "XF86AudioRaiseVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10% && $refresh_i3status";
          "XF86AudioLowerVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -10% && $refresh_i3status";
          "XF86AudioMute" = "exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && $refresh_i3status";
          "Insert" = "exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle && $refresh_i3status";
          "${modifier}+Left" = "focus left";
          "${modifier}+Up" = "focus up";
          "${modifier}+Right" = "focus right";
          "${modifier}+Down" = "focus down";
          "${modifier}+Shift+Left" = "move left";
          "${modifier}+Shift+Down" = "move down";
          "${modifier}+Shift+Up" = "focus up";
          "${modifier}+Shift+Right" = "focus right";
          "${modifier}+f" = "fullscreen toggle";
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
    };
  };
}
