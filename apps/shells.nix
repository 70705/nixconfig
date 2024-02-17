{ config, pkgs, lib, ... }:


{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    # TODO add your cusotm bashrc here
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      keeweb = "keeweb --no-sandbox";
     };
    oh-my-zsh.enable = true;
    oh-my-zsh.theme = "Chicago95";
    oh-my-zsh.custom = "/etc/nixos/xfce-home/ohmyzsh";
  };

}
