{ 
  lib, 
  config,
  ... 
}:

let
  cfg = config.hmModules.hypr.hyprlock;
in
  {
    options.hmModules.hypr.hyprlock = {
      enable = lib.mkEnableOption "hyprlock";
    };

    config = lib.mkIf cfg.enable {
      programs.hyprlock = {
        enable = true;
        settings = {
          general = {
            no_fade_in = true;
          };

          background = [
            {
              path = "/etc/nixos/modules/hm/hypr/wallpaper.png";
              blur_passes = 3;
              blur_size = 8;
            }
          ];
          input-field = [
            {
              monitor = "";
              size = "200, 50";
              outline_thickness = 3;
              dots_size = 0.33;
              dots_spacing = 0.15;
              dots_center = false;
              dots_rounding = -1;
              outer_color = "rgb(151515)";
              inner_color = "rgb(200, 200, 200)";
              font_color = "rgb(10, 10, 10)";
              fade_on_empty = false;
              placeholder_text = "<i>Input Password...</i>";
              hide_input = false;
              rounding = -1;
              check_color = "rgb(204, 136, 34)";
              fail_color = "rgb(204, 34, 34)";
              fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
              fail_timeout = 2000;
              fail_transition = 300;
              capslock_color = -1;
              numlock_color = -1;
              bothlock_color = -1;
              invert_numlock = false;
              swap_font_color = false;
              position = "0, -20";
              halign = "center";
              valign = "center";
            }
          ];
          label = [
            {
              monitor = "";
              text = "$TIME";
              text_align = "center";
              color = "rgba(200, 200, 200, 1.0)";
              font_size = 25;
              font_family = "Noto Sans";
              position = "0, 80";
              halign = "center";
              valign = "center";
            }
          ];
        };
      };
    };
  }
