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
    winePackages.staging
    (inputs.nix-gaming.packages.${pkgs.system}.osu-stable.override { wine = pkgs.winePackages.staging; tricks = [ "gdiplus" "dotnet48" "meiryo" "allfonts"]; })

  ];
 
}
