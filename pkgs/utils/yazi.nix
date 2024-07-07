{ 
  pkgs,
  ...
}:

{
  programs.yazi = {
     enable = true;
     enableFishIntegration = true;
     package = pkgs.yazi;
   };

  xdg.desktopEntries = {
    yazi = {
      name = "Yazi";
      comment = "Blazing fast terminal file manager written in Rust, based on async I/O";
      exec = "wezterm start yazi %f";
      mimeType = [ "inode/directory" ];
      categories = [ "System" "FileTools" "FileManager" "Utility" "Core" ];
      terminal = false;
      icon = "yazi";
    };
  };

}
