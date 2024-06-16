{ 
  pkgs,
  inputs,
  ... 
}:

{
  imports = [
    ./git.nix
    ./vscode.nix
  ];
  home.packages = with pkgs; [

    keepass
    keepass-keepassrpc
    libsecret
    gnome.gnome-keyring

    zip
    unzip
    rar
    xz
    ouch
    xarchiver
    
    comma

    ripgrep 
    fzf

    inputs.nix-alien.packages.${pkgs.system}.nix-alien
    nix-index
    appimage-run

    maim
    xclip

    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg
    neofetch

    jq

    sysstat
    lm_sensors
    ethtool
    pciutils 
    usbutils 
    btop

    nil
    python3

    qbittorrent

    inputs.nixvim-config.packages.${pkgs.system}.default
  ];

  services.kdeconnect.enable = true;
}
