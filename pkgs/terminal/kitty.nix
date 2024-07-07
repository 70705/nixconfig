{ 
  pkgs, 
  ... 
}:

{
   programs.kitty = {
     enable = true;
     settings = {
       remember_window_size = "yes";
       initial_window_width = 640;
       initial_window_height = 400;
       mouse_hide_wait = 0;
       enable_layouts = "grid";
    };

     extraConfig = "confirm_os_window_close 0";

     shellIntegration.enableZshIntegration = true;
     package = pkgs.kitty;
     theme = "Dark Pastel";
     keybindings = { "ctrl+shift+left" = "previous_window"; "ctrl+shift+right" = "next_window"; "ctrl+q" = "close_window"; };

     font = {
       name = "IosevkaTerm NFM";
       size = 14;
    };
  };
}     
