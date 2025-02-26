{ ... }:

{
  programs = {
    oh-my-posh = {
      enable = true;
      settings = {
        "$schema" = "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json";
        blocks = [
          {
            alignment = "left";
            segments = [
              {
                foreground = "#FFFFFF";
                properties = {
                  time_format = "15:04:05";
                };
                style = "plain";
                template = "[{{ .CurrentDate | date .Format }}]";
                type = "time";
              }
              {
                type = "command";
                foreground = "#FFFFFF";
                interpret = false;

                template = " [{{ .Output }}]";
                properties = {
                  shell = "zsh";
                  command = "test 0 -ne $(nix-shell-info | wc -w) && nix-shell-info | awk '{print substr($0, 8, length($0)-11)}'";
                };
              }
              {
                type = "text";
                style = "plain";
                template = "\n";
              }
              {
                foreground = "#B5B50D";
                style = "plain";
                template = "  ";
                type = "root";
              }
              {
                foreground = "red";
                style = "plain";
                template = "{{ .Code }} ";
                type = "status";
              }
              {
                type = "executiontime";
                template = "{{ .FormattedMs }} ";
                properties = {
                  style = "austin";
                  threshold = 500;
                };
              }
              {
                foreground = "#FFFFFF";
                style = "plain";
                template = "% ";
                type = "text";
              }
            ];
            type = "prompt";
          }
          {
            segments = [
              {
                foreground = "#FFFFFF";
                template = " {{ .Path }}";
                type = "path";

                properties = {
                  style = "folder";
                };

              }
              {
                foreground = "yellow";
                style = "plain";
                template = " <#FFFFFF>➜</> {{ .UpstreamIcon }}{{ .HEAD }}{{if .BranchStatus }} {{ .BranchStatus }}{{ end }}{{ if .Working.Changed }} <#FF0000>!</> {{ .Working.String }}{{ end }}{{ if and (.Working.Changed) (.Staging.Changed) }} <#FFFF00>|</>{{ end }}{{ if .Staging.Changed }} <#00FFFF>+</> {{ .Staging.String }}{{ end }}{{ if gt .StashCount 0 }} <#FF00FF>$</> {{ .StashCount }}{{ end }}";                type = "git";

                properties = {
                  branch_icon = "";
                  branch_gone_icon = "≢";
                  branch_behind_icon = "↓";
                  branch_ahead_icon = "↑";
                  branch_identical_icon = "≡";
                };
              }
            ];
            type = "rprompt";
          }
        ];
        version = 3;
      };
    };
  };
}