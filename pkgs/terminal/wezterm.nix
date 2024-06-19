{ ... }:

{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      return {
        font = wezterm.font("IosevkaTerm Nerd Font"),
        font_size = 14.0,
        default_cursor_style = "BlinkingBar",
        enable_tab_bar = false,
        color_scheme = "Erebus (terminal.sexy)",
        window_background_opacity = 0.8,
        front_end = "WebGpu",
      }'';
  };
}
