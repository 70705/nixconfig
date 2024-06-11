{ 
  pkgs,
  lib,
  ... 
}:

{


  xsession.windowManager.i3 = {
    enable = true;
    terminal = "kitty";

    config = {

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

      modifier = "Mod4";

      startup = [
        { command = "/etc/nixos/system/i3config/polybar/launch.sh"; always = true; notification = false; }
        { command = "setroot -z /etc/nixos/system/i3config/wallpaper.png"; always = true; notification = false; }
        { command = "autotiling"; always = true; notification = false; }
        { command = "AudioRelay"; always = true; notification = false; }
      ];

      keybindings = let
        modifier = config.xsession.windowManager.i3.config.modifier;
        in lib.mkOptionDefault {
          "${modifier}+q" = "kill";
          "${modifier}+Space" = "exec --no-startup-id rofi -show drun -theme /etc/nixos/system/i3config/rofi/launcher.rasi";
          "${modifier}+h" = "exec --no-startup-id /etc/nixos/system/i3config/script.sh";
          "${modifier}+v" = "move scratchpad";
          "${modifier}+s" = "floating toggle";
      };
    };
  };
}
