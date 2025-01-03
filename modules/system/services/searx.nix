{
  pkgs,
  config,
  ...
}:

{
  sops.secrets.searx = { };
  services.searx = {
    enable = true;
    package = pkgs.searxng;
    environmentFile = config.sops.secrets.searx.path;
    settings = {
      server = {
        port = 8888;
        bind_address = "127.0.0.1";
        secret_key = "@SEARX_SECRET_KEY@";
      };

      search = {
        safe_search = 0;
        autocomplete = "google";
        default_lang = "all";
      };

      ui = {
        results_on_new_tab = true;
        default_locale = "pt-BR";
      };

      engines = [
        {
          name = "qwant";
          disabled = true;
        }
        {
          name = "duckduckgo";
          disabled = true;
        }
        {
          name = "brave";
          disabled = false;
        }
        {
          name = "google";
          disabled = false;
          weight = 2.0; # 2.0 if others are not disabled
        }
        {
          name = "qwant news";
          disabled = true;
        }
        {
          name = "qwant images";
          disabled = true;
        }
        {
          name = "qwant videos";
          disabled = true;
        }
        {
          name = "unsplash";
          disabled = true;
        }
        {
          name = "flickr";
          disabled = true;
        }
        {
          name = "artic";
          disabled = true;
        }
        {
          name = "library of congress";
          disabled = true;
        }
        {
          name = "openverse";
          disabled = true;
        }
        {
          name = "wikicommons.images";
          disabled = true;
        }
        {
          name = "deviantart";
          disabled = true;
        }
        {
          name = "piped";
          disabled = true;
        }
        {
          name = "wikicommons.videos";
          disabled = true;
        }
        {
          name = "piped.music";
          disabled = true;
        }
        {
          name = "wikicommons.audio";
          disabled = true;
        }
        {
          name = "wikicommons.files";
          disabled = true;
        }
        {
          name = "nyaa";
          disabled = false;
        }
        {
          name = "tokyotoshokan";
          disabled = false;
        }
        {
          name = "1337x";
          disabled = false;
        }
        {
          name = "mastodon hashtags";
          disabled = true;
        }
        {
          name = "mastodon users";
          disabled = true;
        }
        {
          name = "lemmy users";
          disabled = true;
        }
        {
          name = "lemmy posts";
          disabled = true;
        }
        {
          name = "lemmy communities";
          disabled = true;
        }
        {
          name = "lemmy comments";
          disabled = true;
        }
        {
          name = "tootfinder";
          disabled = true;
        }
        {
          name = "wikidata";
          disabled = false;
        }
        {
          name = "mixcloud";
          disabled = true;
        }
        {
          name = "genius";
          disabled = true;
        }
        {
          name = "dailymotion";
          disabled = true;
        }
        {
          name = "sepiasearch";
          disabled = true;
        }
        {
          name = "vimeo";
          disabled = true;
        }
        {
          name = "wallhaven";
          disabled = true;
        }
        {
          name = "pinterest";
          disabled = true;
        }
        {
          name = "bing images";
          disabled = true;
        }
        {
          name = "bing";
          disabled = false;
        }
        {
          name = "mojeek";
          disabled = false;
        }
        {
          name = "yahoo";
          disabled = false;
        }
        {
          name = "ddg definitions";
          disabled = false;
        }
      ];
    };
  };
}
