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

    initExtra = ''
      any-nix-shell zsh --info-right | source /dev/stdin

      function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
      }
    '';

    oh-my-zsh = {
      enable = true;
      plugins = ["starship"];
    };
  };
}

