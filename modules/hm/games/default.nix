{
  pkgs, 
  ... 
}:

{
  home.packages = with pkgs; [

    vesktop
    gamemode
    mangohud
    prismlauncher
    wineWow64Packages.stagingFull
#    inputs.nix-gaming.packages.${pkgs.system}.osu-lazer-bin
    #(wineWow64Packages.full.override { wineRelease = "staging"; waylandSupport = true;})
#    inputs.nix-gaming.packages.${pkgs.system}.wine-tkg
#    inputs.rhythia.packages.${pkgs.system}.sound-space-plus
#    (inputs.nix-gaming.packages.${pkgs.system}.osu-stable.override { wine = inputs.nix-gaming.packages.${pkgs.system}.wine-tkg; tricks = [ "gdiplus" "dotnet48" "meiryo" "allfonts"]; })

  ];
 
}
