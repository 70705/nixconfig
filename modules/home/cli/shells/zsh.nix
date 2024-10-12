{
  sysVar,
  ...
}:

{
  programs.zsh = {
    enable = if sysVar.shell == "zsh" then true else false;
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
      emacs = ''emacsclient -r --alternate-editor=""'';
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "starship" ];
    };
  };
}
