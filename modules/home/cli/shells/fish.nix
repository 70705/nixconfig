{
  sysVar,
  ...
}:

{
  programs.fish = {
    enable = if sysVar.shell == "fish" then true else false;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting

      any-nix-shell fish --info-right | source
    '';

    functions = {
      yy = ''
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        	yazi $argv --cwd-file="$tmp"
        	if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        		cd -- "$cwd"
        	end
                rm -f -- "$tmp"'';
      starship_transient_prompt_func = ''starship module character'';
    };

    shellAliases = {
      doom = "~/.config/emacs/bin/doom";
      emacs = ''emacsclient -r --alternate-editor=""'';
    };
  };
}
