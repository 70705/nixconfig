{
  pkgs, 
  pkgs-unstable,
  inputs,
  ... 
}:

{
  home.packages = with pkgs; [

    pkgs-unstable.vesktop
    gamemode
    lutris
    bottles
    mangohud
    prismlauncher
    steam
    
    inputs.nix-gaming.packages.${pkgs.system}.wine-tkg
    (inputs.nix-gaming.packages.${pkgs.system}.osu-stable.override { wine = inputs.nix-gaming.packages.${pkgs.system}.wine-tkg; tricks = [ "gdiplus" "dotnet48" "meiryo" "allfonts"]; })

  ];
 
}
