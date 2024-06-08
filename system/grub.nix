{ config, lib, pkgs, ... }:

{

  boot.loader = {
    grub.enable = true;
    grub.efiSupport = true;
    grub.efiInstallAsRemovable = true;
    grub.useOSProber = true;
    grub.device = "nodev";
    efi.canTouchEfiVariables = false;
  };
}
