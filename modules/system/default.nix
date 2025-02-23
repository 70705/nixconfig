{
  pkgs,
  inputs,
  sysVar,
  ...
}:

{

  imports = [
    ./wm
    ./essential
    ./gaming
  ];

  users = {
    users.${sysVar.username} = {
      isNormalUser = true;
      initialPassword = "1337";
      extraGroups = [
        "wheel"
        "video"
        "render"
        "media"
        "audio"
      ];
      shell = pkgs.${sysVar.shell};
    };
  };

  boot = {
    kernelPackages = pkgs.${sysVar.kernel};

    supportedFilesystems = [ "ntfs" ];
    kernelParams =
      if sysVar.gpu == "nvidia" then
        [
          "nvidia-drm.modeset=1"
          "nvidia-drm.fbdev=1"
        ]
      else
        ""; # null
  };

  nixpkgs = {
    overlays = [ 
      inputs.nur.overlays.default 
    ];
    config.allowUnfree = true;
  };

  documentation = {
    man.enable = false;
    doc.enable = false;
    info.enable = false;
    nixos.enable = false;
  };

  networking = {
    hostName = sysVar.hostname;
    firewall.enable = false;

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
      "https://ezkea.cachix.org"
    ];
    trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
      "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="
    ];
  };

  environment.pathsToLink = [
    "/share/xdg-desktop-portal"
    "/share/applications"
  ];

  time.timeZone = sysVar.timezone;
  i18n = {
    defaultLocale = sysVar.locale;
    supportedLocales = sysVar.extraLocale;
  };

  services = {
    gvfs.enable = true;
    gnome.gnome-keyring.enable = true;
    tumbler.enable = true;
  };

  programs = {
    zsh.enable = if sysVar.shell == "zsh" then true else false;
    fish.enable = if sysVar.shell == "fish" then true else false;

    dconf.enable = true;

    appimage = {
      enable = true;
      binfmt = true;
    };

    nh = {
      enable = true;
      flake = "/home/${sysVar.username}/nixos";

      clean = {
        enable = true;
        extraArgs = "--keep 10 --keep-since 7d";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    wget
    curl
  ];
}
