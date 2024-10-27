{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [ nss_latest ];

  networking.extraHosts = ''
    127.0.0.1 totos.home.arpa
    127.0.0.1 lanraragi.totos.home.arpa
    127.0.0.1 qbittorrent.totos.home.arpa
    127.0.0.1 searxng.totos.home.arpa
  '';
  services.caddy = {
    enable = true;

    virtualHosts = {
      "totos.home.arpa".extraConfig = ''

        reverse_proxy localhost:8082
      '';
      "lanraragi.totos.home.arpa".extraConfig = ''

        reverse_proxy localhost:3000
      '';
      "qbittorrent.totos.home.arpa".extraConfig = ''

        reverse_proxy localhost:8080
      '';
      "searxng.totos.home.arpa".extraConfig = ''

        reverse_proxy localhost:8888
      '';
    };

  };
}
