{
  sysVar,
  ...
}:

{
  programs.starship = {
    enable = false;
    enableTransience = if sysVar.shell == "fish" then true else false;
    settings = {
      add_newline = true;
      format = "$time\${custom.nix}$line_break$cmd_duration$character";

      right_format = "$directory$git_branch$git_state$git_status";

      time = {
        disabled = false;
        format = ''[\[$time\]]($bold white) '';
        time_format = "%T";
      };

      hostname = {
        ssh_only = false;
        format = "[$hostname](#acacac) on ";
        disabled = true;
      };

      directory = {
        truncation_length = 2;
        style = "bold white";
      };

      custom.nix = {
        command = "nix-shell-info | awk '{print substr($0, 8, length($0)-11)}'";
        when = "test 0 -ne $(nix-shell-info | wc -w)";
        format = "\\[$output\\](bold white)";
        os = "linux";
      };

      character = {
        success_symbol = "[%](bold bright-white)";
        error_symbol = "[!](red)";
        vimcmd_symbol = "[%](green)";
      };

      git_branch = {
        format = "➜ [$branch]($style) ";
        style = "bold white";
      };

      git_status = {
        format = "[[($all_status)](218) ($ahead_behind$stashed)]($style)";
        style = "cyan";
      };

      git_state = {
        format = ''\([$state( $progress_current/$progress_total)]($style)\) '';
        style = "bold white";
      };

      cmd_duration = {
        format = "[$duration]($style) ";
        style = "bold white";
      };

      python = {
        format = "[$virtualenv]($style) ";
        style = "bold white";
      };

    };
  };
}
