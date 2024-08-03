{ 
  pkgs,
  ... 
}:

{
  imports = [
    ./vivaldi.nix
  ];

  home.packages = with pkgs; [
    ungoogled-chromium
#    python312Packages.adblock # used for qute's adblock
    widevine-cdm
  ];

}
