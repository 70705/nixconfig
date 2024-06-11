{ ... }:

{

  programs.git = {
    enable = true;
    userName = "70705";
    userEmail = "totos@riseup.net";
    extraConfig = {
      credential.helper = "oauth";
    };
  };


}
