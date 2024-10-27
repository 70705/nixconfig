{ ... }:

{
  services.nginx = {
    enable = true;

    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;

    virtualHosts = {
      "lanraragi.local".locations."/".proxyPass = "http://127.0.0.1:3000";
    };
  };
}
