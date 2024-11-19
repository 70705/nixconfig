{ ... }:

{
  imports = [
    ./audio.nix
    ./nix-ld.nix
    ./grub.nix
    ./disks.nix
    ./fonts.nix
    ./nvidia.nix
    ./keyd.nix
  ];
}
