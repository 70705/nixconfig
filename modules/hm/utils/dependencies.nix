{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    zip
    unzip
    rar
    xz
    ripgrep
    fzf
    bc
    jq
    gtk_engines
    mono
    killall
  ];
}
