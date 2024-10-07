{
  pkgs,
  ...
}:

{

  programs = {
    zoxide = {
      enable = true;
      enableZshIntegration = true;
      package = pkgs.zoxide;
      options = [ "--cmd cd" ];
    };

    thefuck = {
      enable = true;
      enableZshIntegration = true;
    };

    carapace = {
      enable = false;
      enableZshIntegration = false;
      package = pkgs.carapace;
    };

    atuin = {
      enable = true;
      enableZshIntegration = true;
      package = pkgs.atuin;
      settings = {
        style = "full";
        enter_accept = true;
      };
    };

    eza = {
      enable = true;
      enableZshIntegration = true;
      package = pkgs.eza;
      git = true;
      icons = true;

      extraOptions = [
        "--group-directories-first"
        "--header"
        "--long"
        "--no-permissions"
        "--no-user"
      ];
    };
  };
}
