{ ... }:

{

  imports = [./keybindings.nix];

  xsession.windowManager.i3 = {
    enable = true;

    config = {
      
      bars = [];
      modifier = "Mod4";
      terminal = "kitty";
      floating.titlebar = false;
      defaultWorkspace = "workspace number 1";

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
        { command = "polybar"; always = true; notification = false; }
        { command = "setroot -z /etc/nixos/software/i3/wallpaper.png"; always = true; notification = false; }
        { command = "autotiling"; always = true; notification = false; }
        { command = "AudioRelay"; always = true; notification = false; }
      ];
    };
  };
}
