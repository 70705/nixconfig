{ ... }:

{

  boot.loader = {
    grub = {
      enable = true;
      efiSupport = true;
      efiInstallAsRemovable = true;
      useOSProber = true;
      device = "nodev";
    };

    efi.canTouchEfiVariables = false;
  };
}
