{
  pkgs,
  inputs,
  sysVar,
  ...
}:

{

  imports = [
    inputs.sops-nix.nixosModules.sops
    ./wm
    ./essential
    ./gaming
    ./services
  ];

  sops = {
    defaultSopsFile = ./secrets/secrets.yaml;
    defaultSopsFormat = "yaml";

    age.keyFile = "/home/${sysVar.username}/.config/sops/age/keys.txt";

    secrets = {
      email = { };
    };
  };

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
        null;
  };

  nixpkgs = {
    overlays = [ inputs.nur.overlay ];
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

    interfaces.${sysVar.networkInterface}.ipv4.addresses = [
      {
        address = "192.168.0.120";
        prefixLength = 24;
      }
    ];

    defaultGateway = {
      address = "192.168.0.1";
      interface = sysVar.networkInterface;
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
    ethtool
    curl
  ];

  systemd.services.ethtool = {
    description = "Ethtool autorun command";
    after = [ "network.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.ethtool}/sbin/ethtool -s enp3s0f0 speed 100 autoneg on duplex full wol d";
    };
    wantedBy = [ "multi-user.target" ];
  };
}
