{ 
  pkgs,
  lib,
  inputs,
  ... 
}:

{
  imports = [
    ./git.nix
    ./yazi.nix
    ./audiothumbs.nix
  ];
  home.packages = with pkgs; [

    keepassxc
    libsecret
    gnome-keyring

    zip
    unzip
    rar
    xz
    ouch
    
    ripgrep 
    fzf
    bc

    inputs.nix-alien.packages.${pkgs.system}.nix-alien
    nix-index

    clipse
    wl-clipboard

#    file
#    which
#    tree
    neofetch
    qalculate-qt
    wofi

    jq

    todoist-electron

    trashy

#    sysstat
#    lm_sensors
#    ethtool
#    pciutils 
#    usbutils 
    btop

    nil
    python3

    ffmpeg-full
    ffmpegthumbnailer
    pcmanfm
    gtk_engines

    qbittorrent

    inputs.nixvim-config.packages.${pkgs.system}.default
  ];

  services = {
    kdeconnect.enable = true;
    syncthing = {
      enable = true;
      tray.enable = true;
    };
  };
  systemd.user.services.syncthingtray.Service.ExecStart = lib.mkForce
    "${pkgs.bash}/bin/bash -c '${pkgs.coreutils}/bin/sleep 5; ${pkgs.syncthingtray-minimal}/bin/syncthingtray'";

}
