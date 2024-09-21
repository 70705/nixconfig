{ ... }:

{
  programs.zsh = {
    enable = true;
    autocd = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    autosuggestion = {
      enable = true;
      strategy = [
        "history"
        "completion"
        "match_prev_cmd"
      ];
    };

    initExtraFirst = ''
      any-nix-shell zsh | source /dev/stdin
    '';

    shellAliases = {
      doom = "~/.config/emacs/bin/doom";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "starship" ];
    };
  };
}
