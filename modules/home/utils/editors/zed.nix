{pkgs, ...}: {
  programs.zed-editor = {
    enable = true;
    extensions = ["nix"];
    userSettings = {
      lsp = {
        nil = {
          settings = {
            nix.flake.autoArchive = true;
          };
          initialization_options = {
            formatting.command = ["${pkgs.alejandra}/bin/alejandra" "--quiet" "--"];
          };
        };
      };

      diagnostics = {
        inline = {
          enabled = true;
        };
      };

      soft_wrap = "editor_width";

      languages = {
        "Nix".language_servers = ["nil" "!nixd"];
      };

      telemetry = {
        diagnostics = false;
        metrics = false;
      };
    };
  };
}
