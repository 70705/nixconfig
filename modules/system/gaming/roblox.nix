{ 
  pkgs, 
  lib, 
  config,
  ... 
}:

let
  cfg = config.modules.system.gaming.roblox;
  sober = pkgs.fetchurl {
      url = "https://sober.vinegarhq.org/sober.flatpakref";
      sha256 = "1pj8y1xhiwgbnhrr3yr3ybpfis9slrl73i0b1lc9q89vhip6ym2l";
    };
in
{
  options.modules.system.gaming.roblox = {
    enable = lib.mkEnableOption "roblox";
  };

  config = lib.mkIf cfg.enable {
    services.flatpak = {
      enable = true;
      packages = [":${sober}"];
    };
  };
}


