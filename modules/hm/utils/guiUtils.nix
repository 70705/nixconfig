{ 
  pkgs,
  ... 
}:

{

  home.packages = with pkgs; [
    keepassxc
    qalculate-qt
    todoist-electron
    anki-bin
    pcmanfm
    qbittorrent
  ];
}
