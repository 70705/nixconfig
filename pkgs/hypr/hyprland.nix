{
  inputs,
  pkgs,
  ...
}:

{
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    systemd.variables = ["--all"];

    plugins = [];
    extraConfig = builtins.readFile ./config_hyprland.conf;
  };

  home.packages = with pkgs; [
    hyprshot
  ];
}
