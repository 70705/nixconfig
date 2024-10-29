{
  config,
  ...
}:

{
  programs = {
    git = {
      enable = true;
      userName = "70705";
      userEmail = config.sops.secrets.email.path;
    };

    git-credential-oauth.enable = true;
    lazygit.enable = true;
  };
}
