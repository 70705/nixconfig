{ ... }:

{
  programs.zsh = {
    enable = true;
    autocd = true;
    autosuggestion = {
      enable = true;
      strategy = [ "history" "completion" "match_prev_cmd"];
    };
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    initExtraFirst = ''
      any-nix-shell zsh | source /dev/stdin
      '';

    oh-my-zsh = {
      enable = true;
      plugins = ["starship"];
    };
  };
}

