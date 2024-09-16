{ ... }:

{
  programs = {
    git = {
      enable = true;
      userName = "70705";
      userEmail = "totos@riseup.net";
    };

    git-credential-oauth.enable = true;
    lazygit.enable = true;
  };
}
