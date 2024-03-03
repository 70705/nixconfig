{ config, pkgs, lib, pkgs-unstable, audiorelay, nix-alien, nix-gaming, ... }:

{
  imports = [
    ./spicetify.nix
    ./vscode.nix
    ./vivaldi.nix
    ./git.nix
    ./picom.nix
    ./kitty.nix
   ];

  home.packages = with pkgs; [
    
    pkgs-unstable.vesktop
    
    # gaeming!!!!!
    steam
    gamemode
    lutris
    bottles
    mangohud
    prismlauncher
    nix-gaming.packages.${pkgs.system}.wine-ge
    nix-gaming.packages.${pkgs.system}.osu-lazer-bin

 
    # media
    mpv    
    stremio

    # Audio related
    pavucontrol
    alsa-utils
    audiorelay.packages.${pkgs.system}.audio-relay

    # archives
    zip
    unzip
    rar
    p7zip
    xz
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
    nomacs
    lazygit
    comma
    any-nix-shell
 
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
    maim
    xclip
    vivid

    # fonts
    noto-fonts-cjk-sans
    hack-font

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

