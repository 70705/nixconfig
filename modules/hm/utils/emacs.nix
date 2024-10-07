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

  xdg.desktopEntries = {
    "emacsclient" = {
      name = "Emacs (Client)";
      exec = ''sh -c "if [ -n \\"\\$*\\" ]; then exec /nix/store/67znrwn1wjcd78pf4hhpbrl2rsh14nha-emacs-pgtk-29.4/bin/emacsclient --alternate-editor= --reuse-frame \\"\\$@\\"; else exec emacsclient --alternate-editor= --create-frame; fi" sh %F'';
      noDisplay = true;
    };

    "emacs" = {
      name = "Emacs";
      exec = "emacsclient -r %F";
      genericName = "Text Editor";
      comment = "Edit text";
      mimeType = [
        "text/english"
        "text/plain"
        "text/x-makefile"
        "text/x-c++hdr"
        "text/x-c++src"
        "text/x-chdr"
        "text/x-csrc"
        "text/x-java"
        "text/x-moc"
        "text/x-pascal"
        "text/x-tcl"
        "text/x-tex"
        "application/x-shellscript"
        "text/x-c"
        "text/x-c++"
      ];
      icon = "emacs";
      type = "Application";
      terminal = false;
      categories = [
        "Development"
        "TextEditor"
      ];
      startupNotify = true;

    };
  };

  stylix.targets.emacs.enable = false;
}
