{ config, pkgs, pkgs-unstable, audiorelay, nix-alien, ... }:

{
  home.packages = with pkgs; [
    
    pkgs-unstable.vesktop
    
    # gaeming!!!!!
    steam
    gamemode
    lutris
    bottles
    mangohud

    mpv    
    stremio

    # Audio related
    easyeffects
    pavucontrol
    alsa-utils
    audiorelay.packages.${pkgs.system}.audio-relay

    # archives
    zip
    xz
    unzip
    xarchiver

    # utils
    ripgrep # recursively searches directories for a regex pattern
    #jq # A lightweight and flexible command-line JSON processor
    #yq-go # yaml processer https://github.com/mikefarah/yq’
    fzf # A command-line fuzzy finder
    git-credential-oauth
    qbittorrent
    nix-alien.packages.${pkgs.system}.nix-alien
    python3
    pinta

    # password thingies
    keeweb
    libsecret
    gnome.gnome-keyring

    # misc
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg
    neofetch    
    nix-index


    # fonts
    noto-fonts-cjk-sans

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
    htop
  ];

  fonts.fontconfig.enable = true;
  services.kdeconnect.enable = true;

}