# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ 
  pkgs,
  definedVars,
  ...
}:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../modules/nix
    ];

  boot = {
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
    kernelParams = [ "nvidia-drm.modeset=1" "nvidia-drm.fbdev=1" ];
    supportedFilesystems = [ "ntfs" ];
    postBootCommands = ''
      echo 2048 > /sys/class/rtc/rtc0/max_user_freq
      echo 2048 > /proc/sys/dev/hpet/max-user-freq
    '';
  };

  nixModules = {
    system = {
      nix-ld.enable = true;
      audio.enable = true;
    };

    graphical = {
      i3.enable = false;
      hyprland.enable = true;
    };

    gaming = {
      enable = true;
      retroarch.enable = true;
    };
  };

  systemd.services.ethtool = {
    description = "Ethtool autorun command";
    after = [ "network.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.ethtool}/sbin/ethtool -s enp3s0f0 speed 100 autoneg on duplex full wol d";
    };
    wantedBy = [ "multi-user.target" ];
  };

  networking = {
    hostName = definedVars.hostname;
    firewall.enable = false;
  };
  
  users = {
    users.${definedVars.username} = {
      isNormalUser = true;
      initialPassword = "1337";
      extraGroups = [ "wheel" "video" "render" ];
      shell = pkgs.zsh;
    };
  };


  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "23.11"; # Did you read the comment?

}

