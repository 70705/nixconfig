{ ... }:

{

  imports = [./keybindings.nix];

  xsession.windowManager.i3 = {
    enable = true;

    config = {
      
      bars = [];
      modifier = "Mod4";
      terminal = "wezterm";
      floating.titlebar = false;
      defaultWorkspace = "workspace number 1";

      assigns = {
        "1" = [{class="Vivaldi-stable";}];
        "2" = [{class="vesktop";} {class="steam";}];
      };

      gaps = {
        smartBorders = "on";
        top = 29;
        inner = 10;
        outer = 10;
      };

      window = {
        hideEdgeBorders = "smart";
        border = 0;
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
        { command = "/etc/nixos/modules/hm/i3/polybar/launch.sh"; always = true; notification = false; }
        { command = "setroot -z /etc/nixos/modules/hm/i3/wallpaper.png"; always = true; notification = false; }
        { command = "autotiling"; always = true; notification = false; }
        { command = "AudioRelay"; always = true; notification = false; }
      ];
    };
  };
}
