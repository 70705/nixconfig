{ config, pkgs, lib, ... }:

{
  xdg.desktopEntries.keeweb = {
    name="KeeWeb";
    genericName="Password Manager";
    exec="keeweb --no-sandbox %u";
    icon="keeweb";
    terminal=false;
    type="Application";
    categories= [ "Utility" ];
    mimeType=[ "application/x-keepass2" ];
  };

  xdg.desktopEntries.xfce4-web-browser = {
    name="Navegador";
    exec="vivaldi %u";
    icon="org.xfce.webbrowser";
    terminal=false;
    type="Application";
    categories= [ "Network" "X-XFCE" "X-Xfce-Toplevel" ];
    mimeType=[ "x-scheme-handler/http" "x-scheme-handler/https" ];
  };

 xdg.desktopEntries.xfce4-file-manager = {
    name="Gerenciador de Arquivos";
    exec="thunar /home/victor %u";
    icon="org.xfce.filemanager";
    terminal=false;
    type="Application";
    categories= [ "Utility" "X-XFCE" "X-Xfce-Toplevel" ];
    mimeType=[ "inode/directory" "x-scheme-handler/trash" ];
  };

}
