{
  pkgs,
  lib, 
  config,
  ... 
}:

let
  cfg = config.modules.home.graphical.i3;
in
  {
    imports = [./keybindings.nix];
    options.modules.home.graphical.i3 = {
      enable = lib.mkEnableOption "i3";
    };

    config = lib.mkIf cfg.enable {
      home.packages = with pkgs; [
        autotiling
        setroot
        rofi
        zscroll
        xclip
        maim
      ];

      home = {
        file = {
          ".config/pcmanfm/default/pcmanfm.conf" = {
            source = ./pcmanfm.conf;
            force = true;
          };

          ".themes" = {
            source = ./themes;
          };

#          ".icons" = {
#            source = ./icons;
#          };
          
#          ".local/share/fonts" = {
#            source = ./fonts;
#          };

#          gtk = {
#            enable = true;
#            iconTheme.name = "Chicago95-tux";
#            theme.name = "TokyoNight";  
#          };

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
                { command = "/etc/nixos/modules/home/graphical/i3/polybar/launch.sh"; always = true; notification = false; }
                { command = "setroot -z /etc/nixos/modules/home/graphical/i3/wallpaper.png"; always = true; notification = false; }
                { command = "autotiling"; always = true; notification = false; }
                { command = "AudioRelay"; always = true; notification = false; }
              ];
            };
          };
        };
      };
    };
  }
