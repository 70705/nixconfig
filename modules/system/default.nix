{
  pkgs,
  inputs,
  definedVars,
  ...
}:

{

  imports = [
    ./disks.nix
    ./nvidia.nix
    ./grub.nix
    ./graphical/i3.nix
    ./graphical/hyprland.nix
    ./fonts.nix
    ./essential/audio.nix
    ./essential/nix-ld.nix
    ./gaming
    ./gaming/retroarch.nix
  ];

  nixpkgs = {
    overlays = [ inputs.nur.overlay ];
    config.allowUnfree = true;
  };

  networking = {
    interfaces.${definedVars.networkInterface}.ipv4.addresses = [
      {
        address = "192.168.0.120";
        prefixLength = 24;
      }
    ];

    defaultGateway = {
      address = "192.168.0.1";
      interface = definedVars.networkInterface;
    };

    networkmanager = {
      enable = true;
      insertNameservers = [
        "1.1.1.1"
        "1.0.0.1"
      ];
      ethernet.macAddress = "stable";
      dhcp = "dhcpcd";
      dns = "systemd-resolved";
    };
  };

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    auto-optimise-store = true;
    substituters = [
      "https://hyprland.cachix.org"
      "https://nix-gaming.cachix.org"
    ];
    trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
    ];
  };

  environment.pathsToLink = [
    "/share/xdg-desktop-portal"
    "/share/applications"
  ];

  time.timeZone = definedVars.timezone;
  i18n = {
    defaultLocale = definedVars.locale;
    supportedLocales = definedVars.extraLocale;
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

    nh = {
      enable = true;
      flake = /etc/nixos;

      clean = {
        enable = true;
        extraArgs = "--keep 10 --keep-since 7d";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    wget
    ethtool
    curl
  ];

}
