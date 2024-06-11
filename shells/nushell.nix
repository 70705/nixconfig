{ 
  pkgs-unstable, 
  ... 
}:

{
  programs.nushell = {
    enable = true;
    package = pkgs-unstable.nushellFull;
    extraConfig = ''
      $env.LS_COLORS = (vivid generate snazzy | str trim)


      let carapace_completer = {|spans|
      carapace $spans.0 nushell ...$spans | from json
    }

      $env.config = {
        show_banner: false,
        completions: {
        external: {
          enable: true
          completer: $carapace_completer
        }
      }
    } 

    def n-trash [] { nix-collect-garbage; sudo nix-collect-garbage; sudo nix-collect-garbage -d}''; 

  shellAliases = {
      keeweb = "keeweb --no-sandbox";
      suna = "sudo nano";
      n-rebuild = "sudo nixos-rebuild switch";
    };
  };
}
