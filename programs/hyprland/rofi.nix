{ pkgs, config, lib, ... }:
let 
  inherit (config.lib.formats.rasi) mkLiteral;
  # this is the accent color. its lavender
  accent = mkLiteral "#${config.lib.stylix.colors.base0D}a0"; 
  bg = mkLiteral "#${config.lib.stylix.colors.base01}90";
  txt = mkLiteral "#${config.lib.stylix.colors.base05}ff";
  txt_accent = mkLiteral "#${config.lib.stylix.colors.base06}ff";
in
{
  programs.rofi = {
    enable = true;
    cycle = true;
    package = pkgs.rofi-wayland;

    theme = {
      "*" = {
        background-color = mkLiteral "#00000000";
        text-color = txt;
      };
      "configuration" = {
        show-icons = true;
        display-drun = "⬤";
        drun-display-format = "{icon} {name}";
        disable-history = false;
        click-to-exit = true;
        location = 0;
      };

      "window" = {
          background-color = bg;
          transparency = "real";
          border = mkLiteral "2px";
          border-color = accent;
          border-radius = mkLiteral "10px";
          width = mkLiteral "500px";
          anchor = "center";
          x-offset = 0;
          y-offset = 0;
      };

      "entry" = {
          # placeholder-color = @FG;
          expand = true;
          horizontal-align = 0;
          placeholder = "Search...";
          blink = true;
          border = mkLiteral "0px 0px 2px 0px";
          border-color = accent;
          border-radius = mkLiteral "10px";
          padding = mkLiteral "8px";
          text-color = txt_accent;
      };

      "inputbar" = {
        children = [ "entry" ];
          expand = false;
          border = mkLiteral "0px 0px 0px 0px";
          border-radius = mkLiteral "0px";
          # border-color = @BDR; 
          margin = mkLiteral "0px 0px 0px 0px";
          padding = mkLiteral "0px";
          position = mkLiteral "center";
      };

      "case-indicator" = {
          spacing = 0;
      };


      "listview" = {
          columns = 1;
          lines = 7;
          spacing = mkLiteral "4px";
          cycle = true;
          dynamic = true;
          layout = mkLiteral "vertical";
      };

      "mainbox" = {
          children = [ "inputbar" "listview" ];
          spacing = mkLiteral "15px";
          padding = mkLiteral "15px";
      };

      "element" = {
          orientation = mkLiteral "horizontal";
          border-radius = mkLiteral "4px";
          padding = mkLiteral "6px 6px 6px 6px";
      };

      "element-icon" = {
          horizontal-align = mkLiteral "0.5";
          vertical-align = mkLiteral "0.5";
          size = mkLiteral "24px";
          border = mkLiteral "0px";
      };

      # "element-text" = {
      #     text-color = txt;
      #     expand = true;
      #     horizontal-align = 0;
      #     vertical-align = mkLiteral "0.5";
      #     margin = mkLiteral "2px 0px 2px 2px";
      # };

      "element selected" = {
          background-color = accent;
          text-color = txt_accent;
          border = mkLiteral "0px 0px 0px 0px";
          border-radius = mkLiteral "10px";
      };
      "element-text" = {
        text-color = mkLiteral "inherit";
      };
    };
  };
}