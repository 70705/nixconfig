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

    initExtra = ''
      bindkey "\e[1;5C" forward-word
      bindkey "\e[1;5D" backward-word
      bindkey '^H' backward-kill-word
    '';

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
