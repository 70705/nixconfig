{ ... }:
{
  programs.niri = {
    settings = {
      window-rules = [
        {
          matches = [];
          geometry-corner-radius = let radius = 12.0; in {
            top-left = radius;
            top-right = radius;
            bottom-left = radius;
            bottom-right = radius;
          };
          clip-to-geometry = true;
        }
      ];

      binds = {
        "Mod+m".action.maximize-column = [];
        "Mod+c".action.center-column = [];
        "Mod+r".action.switch-preset-column-width = [];
        "Mod+Minus".action.set-column-width = "-10%";
        "Mod+Equal".action.set-column-width = "+10%";
        "Mod+Shift+Minus".action.set-window-height = "-10%";
        "Mod+Shift+Equal".action.set-window-height = "+10%";
        "Mod+Print".action.screenshot = [];
        "Mod+f".action.fullscreen-window = [];
        "Mod+q".action.close-window = [];
        "Mod+Return".action.spawn = "wezterm";
        "Mod+1".action.focus-workspace = 1;
        "Mod+Shift+1".action.move-window-to-workspace = 1;
        "Mod+2".action.focus-workspace = 2;
        "Mod+Shift+2".action.move-window-to-workspace = 2;
        "Mod+3".action.focus-workspace = 3;
        "Mod+Shift+3".action.move-window-to-workspace = 3;
        "Mod+4".action.focus-workspace = 4;
        "Mod+Shift+4".action.move-window-to-workspace = 4;
        "Mod+5".action.focus-workspace = 5;
        "Mod+Shift+5".action.move-window-to-workspace = 5;
        "Mod+6".action.focus-workspace = 6;
        "Mod+Shift+6".action.move-window-to-workspace = 6;
        "Mod+7".action.focus-workspace = 7;
        "Mod+Shift+7".action.move-window-to-workspace = 7;
        "Mod+8".action.focus-workspace = 8;
        "Mod+Shift+8".action.move-window-to-workspace = 8;
        "Mod+9".action.focus-workspace = 9;
        "Mod+Shift+9".action.move-window-to-workspace = 9;
        "Mod+Shift+Left".action.move-column-left = [];
        "Mod+Shift+Up".action.move-window-up = [];
        "Mod+Shift+Down".action.move-window-down = [];
        "Mod+Shift+Right".action.move-column-right = [];
        "Mod+Left".action.focus-column-left = [];
        "Mod+Up".action.focus-window-up = [];
        "Mod+Down".action.focus-window-down = [];
        "Mod+Right".action.focus-column-right = [];
        "Mod+Comma".action.consume-window-into-column = [];
        "Mod+Period".action.expel-window-from-column = [];

      };

      outputs."HDMI-A-1" = {
        enable = true;
        mode = {
          refresh = 74.973;
          width = 1920;
          height = 1080;
        };
      };
      input = {
        keyboard.xkb.layout = "br";
        focus-follows-mouse = true;
        mouse = {
          enable = true;
          accel-profile = "flat";
        };
      };

      hotkey-overlay.skip-at-startup = true;
      prefer-no-csd = true;
    };
  };
}
