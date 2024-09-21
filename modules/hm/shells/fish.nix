{
  pkgs,
  ...
}:

{
  programs.fish = {
    enable = true;
    package = pkgs.fish;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting

      any-nix-shell fish --info-right | source
    '';
    plugins = [
      {
        name = "pisces";
        src = pkgs.fishPlugins.pisces.src;
      }
    ];

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
      n-rebuild = "sudo nixos-rebuild switch";
      n-trash = "nix-collect-garbage && sudo nix-collect-garbage && sudo nix-collect-garbage -d";
    };
  };
}
