{
  ...
}:

{
  programs = {
    git = {
      enable = true;
      userName = "70705";
      userEmail = "70705@riseup.net";
    };

    git-credential-oauth.enable = true;
    lazygit = {
      enable = true;
      settings = {
        os.editPreset = "vscode";
      };
    };
  };
}
