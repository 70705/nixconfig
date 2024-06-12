{ 
  pkgs,
  ... 
}:

{
  imports = [
    ./qute.nix
    ./vivaldi.nix
  ];

  home.packages = with pkgs; [

    python312Packages.adblock # used for qute's adblock
    widevine-cdm

  ];

}
