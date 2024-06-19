{ ... }:

{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      return {
        font = wezterm.font("IosevkaTerm NFM"),
        font_size = 14.0,
        enable_tab_bar = false,
        color_scheme = "tlh (terminal.sexy)"
      }
    '';
  };
}
