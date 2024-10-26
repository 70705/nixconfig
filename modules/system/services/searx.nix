{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    searxng
  ];
  services.searx = {
    enable = true;
    settings = {
      server = {
        port = 8888;
        bind_address = "127.0.0.1";
        secret_key = "8e8399a9a5b6be6fabd7e0694aee0003"; # This will be changed later, silly.
      };
    };
  };
}
