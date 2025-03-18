{pkgs, ...}: {
  programs.helix = {
    enable = true;
    settings = {
      editor = {
        clipboard-provider = "wayland";
        bufferline = "multiple";

        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };

        indent-guides = {
          render = true;
          character = "┆";
          skip-levels = 1;
        };

        soft-wrap = {
          enable = true;
        };

        inline-diagnostics = {
          cursor-line = "error";
          other-lines = "error";
        };
      };
    };
    languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter.command = "${pkgs.alejandra}/bin/alejandra";
        }
      ];
    };
  };
}
