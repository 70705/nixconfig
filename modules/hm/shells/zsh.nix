{ ... }:
let
  theme = import ./typewrittenTheme/npins;

in
  {

    home.file = {
      ".omz/themes/typewritten" = { 
        source = "${theme.typewritten.outPath}/";
        force = true;
      };
    };
    home.file = {
      ".omz/shell.sh" = { 
        source = ./typewrittenTheme/shell.sh;
        force = true;
      };
    };

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
      export TYPEWRITTEN_SYMBOL="$"
      export TYPEWRITTEN_ARROW_SYMBOL="➜"

      any-nix-shell zsh | source /dev/stdin

      TYPEWRITTEN_RIGHT_PROMPT_PREFIX_FUNCTION=~/.omz/shell.sh
      '';

    oh-my-zsh = {
      enable = true;
      custom = "$HOME/.omz";
      theme = "typewritten/typewritten";
      # plugins = ["starship"];
    };
  };
}

