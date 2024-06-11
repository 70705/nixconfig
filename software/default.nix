{
  pkgs, 
  pkgs-unstable,
  inputs,
  ... 
}:

{
  imports = [
    ./spicetify.nix
    ./vscode.nix
    ./vivaldi.nix
    ./git.nix
    ./picom.nix
    ./kitty.nix
    ./qute.nix
    ./mpv.nix
   ];

  home.packages = with pkgs; [
    
    pkgs-unstable.vesktop
    
    # gaeming!!!!!
    gamemode
    lutris
    bottles
    mangohud
    prismlauncher
    steam
    winePackages.staging
    (inputs.nix-gaming.packages.${pkgs.system}.osu-stable.override { wine = pkgs.winePackages.staging; tricks = [ "gdiplus" "dotnet48" "meiryo" "allfonts"]; })
 
    # media    
    stremio
    mpv
    strawberry-qt6
 
    # Audio related
    pavucontrol
    alsa-utils
    inputs.audiorelay.packages.${pkgs.system}.audio-relay
    playerctl

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
    inputs.nix-alien.packages.${pkgs.system}.nix-alien
    python3
    pinta
    nomacs
    lazygit
    comma
    any-nix-shell
    nil
    python312Packages.adblock
    polybarFull
    inputs.nixvim-config.packages.${pkgs.system}.default

    # password thingies
    keepass
    keepass-keepassrpc
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
    appimage-run
    widevine-cdm
    zscroll
 
    # fonts
    noto-fonts-cjk-sans
    hack-font
    font-awesome
    (pkgs.nerdfonts.override {fonts = ["NerdFontsSymbolsOnly"];})

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

