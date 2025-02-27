{sysVar, ...}: {
  programs.zsh = {
    enable =
      if sysVar.shell == "zsh"
      then true
      else false;
    autocd = true;
    enableCompletion = true;
    enableVteIntegration = true;
    syntaxHighlighting = {
      enable = true;
      highlighters = ["main" "brackets" "cursor"];
    };

    autosuggestion = {
      enable = true;
      strategy = [
        "history"
        "completion"
        "match_prev_cmd"
      ];
    };

    initExtraFirst = ''
      zstyle ':completion:*' menu select
      any-nix-shell zsh | source /dev/stdin
    '';

    shellAliases = {
      doom = "~/.config/emacs/bin/doom";
      emacs = ''emacsclient -r --alternate-editor=""'';
    };
  };
}
