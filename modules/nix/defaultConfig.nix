{ 
  pkgs,
  inputs,
  ...
}:

{

  nixpkgs = {
    overlays = [ inputs.nur.overlay ];
    config.allowUnfree = true;
  };

  nix.settings = {
    experimental-features = [ "nix-command" "flakes"];
    auto-optimise-store = true;
    substituters = [
      "https://nix-gaming.cachix.org"
      "https://hyprland.cachix.org"
    ];
    trusted-public-keys = [
      "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };

  environment.pathsToLink = [ "/share/xdg-desktop-portal" "/share/applications" ];

  time.timeZone = "America/Recife";
  i18n = {
    defaultLocale = "pt_BR.UTF-8";
    supportedLocales = [ 
      "en_US.UTF-8/UTF-8"
      "pt_BR.UTF-8/UTF-8"
      "C.UTF-8/UTF-8"
      "ja_JP.UTF-8/UTF-8"
    ];
  };

  services = {
    gvfs.enable = true;
    gnome.gnome-keyring.enable = true;
    tumbler.enable = true;
  };

  programs = {
    zsh.enable = true;
    dconf.enable = true;
    appimage = {
      enable = true;
      binfmt = true;
    };
  };

  environment.systemPackages = with pkgs; [
     wget
     curl
     nh
   ];
}
