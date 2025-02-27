{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.kitty = {
    enable = lib.mkIf config.modules.home.wm.i3.enable true;
    settings = {
      remember_window_size = "yes";
      initial_window_width = 640;
      initial_window_height = 400;
      mouse_hide_wait = 0;
      enable_layouts = "grid";
    };

    extraConfig = "confirm_os_window_close 0";

    package = pkgs.kitty;
    keybindings = {
      "ctrl+shift+left" = "previous_window";
      "ctrl+shift+right" = "next_window";
      "ctrl+q" = "close_window";
    };
  };
}
