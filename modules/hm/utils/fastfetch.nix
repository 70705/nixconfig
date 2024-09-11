{ ... }:

{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "nixos";
      };

      modules = [
        "os"
        "kernel"
        "shell"
        "de"
        "wm"
        "uptime"
        "terminal"
        "cpuusage"
        "memory"
        "swap"
        "disk"
        "localip"
      ];
    };
  };
}
