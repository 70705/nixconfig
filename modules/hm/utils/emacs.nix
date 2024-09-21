{
  pkgs,
  ...
}:

{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs29-pgtk;
    extraPackages = epkgs: with epkgs; [ vterm ];
  };

  stylix.targets.emacs.enable = false;
}
