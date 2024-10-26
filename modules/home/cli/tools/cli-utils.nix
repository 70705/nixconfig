{ ... }:

{

  programs = {
    zoxide = {
      enable = true;
      options = [ "--cmd cd" ];
    };

    thefuck = {
      enable = true;
    };

    atuin = {
      enable = true;
      settings = {
        style = "full";
        enter_accept = true;
      };
    };

    eza = {
      enable = true;
      git = true;
      icons = "always";

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
