# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./system
    ];
   
  boot = {
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
    supportedFilesystems = [ "ntfs" ];
    binfmt.registrations.appimage = {
      wrapInterpreterInShell = false;
      interpreter = "${pkgs.appimage-run}/bin/appimage-run";
      recognitionType = "magic";
      offset = 0;
      mask = ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
      magicOrExtension = ''\x7fELF....AI\x02'';
    };

    postBootCommands = ''
    echo 2048 > /sys/class/rtc/rtc0/max_user_freq
    echo 2048 > /proc/sys/dev/hpet/max-user-freq
   '';
  };

  nixpkgs.config.allowUnfree = true;  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.auto-optimise-store = true;
  nix.settings = {
    substituters = ["https://nix-gaming.cachix.org"];
    trusted-public-keys = ["nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="];
  };

  networking = {
    hostName = "wired";
    networkmanager.enable = true;
    firewall.enable = false;
  };

  time.timeZone = "America/Recife";
  i18n.defaultLocale = "pt_BR.UTF-8";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  environment.pathsToLink = [ "/share/zsh" ];

  users.users.victor = {
     isNormalUser = true;
     initialPassword = "1337";
     extraGroups = [ "wheel" ];
   };

  programs.zsh.enable = true;
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.zsh;
  users.users.victor.shell = pkgs.fish;

  environment.systemPackages = with pkgs; [
     wget
     curl
     git
     xfce.xfce4-i3-workspaces-plugin
     xfce.xfce4-pulseaudio-plugin
     xfce.xfce4-panel-profiles
     xfce.xfce4-whiskermenu-plugin
     gtk_engines
     pulseaudio
     ffmpegthumbnailer
     pcmanfm
   ];

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

