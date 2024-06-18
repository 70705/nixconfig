{ 
  pkgs, 
  pkgs-unstable, 
  ... 
}:

{
  programs.fish = {
    enable = true;
    package = pkgs.fish;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
      set pure_symbol_prompt '$'
      set pure_enable_single_line_prompt true
      set -g async_prompt_functions _pure_prompt_git
    
      any-nix-shell fish --info-right | source
    '';
    plugins = [ 
      { name = "pure"; src = pkgs-unstable.fishPlugins.pure.src; }
      { name = "pisces"; src = pkgs.fishPlugins.pisces.src; }
      { name = "fish-async-prompt"; src = pkgs.fishPlugins.async-prompt.src; }
    ];

    functions = {
      yy = ''
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		cd -- "$cwd"
	end
	rm -f -- "$tmp"'';
    };
 
    shellAliases = {
      n-rebuild = "sudo nixos-rebuild switch";
      n-trash = "nix-collect-garbage && sudo nix-collect-garbage && sudo nix-collect-garbage -d";
    };
  };
}
