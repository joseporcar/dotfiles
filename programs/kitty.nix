{ pkgs, inputs, ... }:
{
  programs.kitty = {
    enable = true;
    theme = "Catppuccin-Macchiato";
    font = {
      name = "Jetbrains Mono";
      size = 12;
    };
    settings = {
      touch_scroll_multiplier = "4.0";
      tab_bar_style = "slant";
    };
  };
}
