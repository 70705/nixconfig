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
    kernelPackages = pkgs.linuxPackagesFor (
      pkgs.linux_xanmod_latest.override {
        argsOverride = rec {
          modDirVersion = "${version}-${suffix}";
          suffix = "xanmod1";
          version = "6.10.11";

          src = pkgs.fetchFromGitHub {
            owner = "xanmod";
            repo = "linux";
            rev = "${version}-${suffix}";
            hash = "sha256-FDWFpiN0VvzdXcS3nZHm1HFgASazNX5+pL/8UJ3hkI8=";
          };
        };
      }
    );

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

  systemd.services.ethtool = {
    description = "Ethtool autorun command";
    after = [ "network.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.ethtool}/sbin/ethtool -s enp3s0f0 speed 100 autoneg on duplex full wol d";
    };
    wantedBy = [ "multi-user.target" ];
  };

  services.suwayomi-server = {
    enable = true;

    settings = {
      server = {
        port = 8081;
        downloadAsCbz = true;
        socksProxyEnabled = false;

        webUIEnabled = true;
        webUIInterface = "browser";
        webUIFlavor = "WebUI";

        initialOpenInBrowserEnabled = false;

        extensionRepos = [
          "https://raw.githubusercontent.com/komikku-app/extensions/repo/index.min.json"
          "https://raw.githubusercontent.com/keiyoushi/extensions/repo/index.min.json"
        ];
      };
    };
  };

}
