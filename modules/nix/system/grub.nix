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

    gfxmodeEfi = "1920x1080";
    gfxmodeBios = "1920x1080";

    efi.canTouchEfiVariables = false;
  };
}
