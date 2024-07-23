{
  pkgs, 
  inputs,
  ... 
}:

{
  home.packages = with pkgs; [

    vesktop
    gamemode
    mangohud
    prismlauncher
    steam
    gamescope
    
    inputs.nix-gaming.packages.${pkgs.system}.wine-tkg
    inputs.rhythia.packages.${pkgs.system}.sound-space-plus
    (inputs.nix-gaming.packages.${pkgs.system}.osu-stable.override { wine = inputs.nix-gaming.packages.${pkgs.system}.wine-tkg; tricks = [ "gdiplus" "dotnet48" "meiryo" "allfonts"]; })

  ];
 
}
