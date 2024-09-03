{ pkgs, inputs, config,... }:
{
  stylix.targets.kitty.enable = false;
  programs.kitty = {
    enable = true;
    font = {
      name = "Jetbrains Mono";
      size = 12;
    };
    settings = {
      touch_scroll_multiplier = "4.0";

      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
      tab_bar_min_tabs = 1;
      tab_activity_symbol = "*";

      tab_bar_background = "#${config.lib.stylix.colors.base01}";
      active_tab_foreground = "#${config.lib.stylix.colors.base0E}";
      active_tab_background = "#${config.lib.stylix.colors.base01}";
      inactive_tab_foreground = "#${config.lib.stylix.colors.base0D}";
      inactive_tab_background = "#${config.lib.stylix.colors.base01}";

      selection_background = "#${config.lib.stylix.colors.base0D}";
      selection_foreground = "#${config.lib.stylix.colors.base00}";

      
      background = "#${config.lib.stylix.colors.base00}";
      background_opacity = "0.5";
      dim_opacity = "1";
      shell_integration = "enabled";


    };
  };
}
