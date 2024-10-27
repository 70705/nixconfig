{ ... }:

{
  services.homepage-dashboard = {
    enable = true;

    services = [
      {
        Status = [
          {
            qBittorrent = {
              icon = "qbittorrent.svg";
              description = "Torrent Status";

              widget = {
                type = "qbittorrent";
                url = "https://qbittorrent.totos.home.arpa";
                username = "admin";
                password = "13371337";
                fields = [
                  "download"
                  "leech"
                  "seed"
                  "upload"
                ];
              };
            };
          }
        ];
      }
    ];
    bookmarks = [
      {
        Self-hosted = [
          {
            LANraragi = [
              {
                abbr = "LRR";
                href = "https://lanraragi.totos.home.arpa";
              }
            ];
          }
          {
            SearXNG = [
              {
                abbr = "SXNG";
                href = "https://searxng.totos.home.arpa";
              }
            ];
          }
        ];
      }
      {
        General = [
          {
            Twitter = [
              {
                icon = "twitter";
                href = "https://twitter.com";
              }
            ];
          }
          {
            Twitch = [
              {
                icon = "twitch";
                href = "https://twitch.tv";
              }
            ];
          }
          {
            YouTube = [
              {
                icon = "youtube";
                href = "https://youtube.com";
              }
            ];
          }
          {
            GitHub = [
              {
                icon = "github";
                href = "https://github.com";
              }
            ];
          }
        ];
      }
    ];

    widgets = [
      {
        openmeteo = {
          latitude = -8.1833;
          longitude = -34.9167;
          timezone = "America/Sao_Paulo";
          units = "metric";
          cache = 5;
          format.maximumFractionDigits = 1;
        };
      }

      {
        datetime = {
          locale = "en";
          format = {
            dateStyle = "long";
            timeStyle = "short";
            hourCycle = "h23";
          };
        };
      }

      {
        resources = {
          label = "System";
          disk = [ "/" ];
          cpu = true;
          memory = true;
          cputemp = false;
          uptime = true;
        };
      }

      {
        resources = {
          label = "Game Disk";
          disk = [ "/media/gamedisk1" ];
        };
      }
      {
        resources = {
          label = "Game Disk 2";
          disk = [ "/media/gamedisk2" ];
        };
      }

      {
        search = {
          provider = "custom";
          url = "https://searxng.totos.home.arpa/?q=";
          target = "_blank";
          suggestionUrl = "https://searxng.totos.home.arpa/autocompleter?q=";
          showSearchSuggestions = true;
        };
      }

    ];
  };
}
