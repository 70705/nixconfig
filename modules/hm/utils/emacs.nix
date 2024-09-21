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

  home.packages = with pkgs; [
    nixfmt-rfc-style
  ];

  stylix.targets.emacs.enable = false;
}
