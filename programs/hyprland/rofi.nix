{ pkgs, config, lib, ... }:
let 
  inherit (config.lib.formats.rasi) mkLiteral;

  bg = mkLiteral "#${config.lib.stylix.colors.base01}80";
  accent = mkLiteral "#${config.lib.stylix.colors.base0E}ff"; 
  txt = mkLiteral "#${config.lib.stylix.colors.base0D}ff";
  txt_accent = mkLiteral "#${config.lib.stylix.colors.base0E}ff";
in
{
  nixpkgs.overlays = [(final: prev: {
    rofi-calc = prev.rofi-calc.override { rofi-unwrapped = prev.rofi-wayland-unwrapped; };
    rofi-emoji = prev.rofi-emoji.override { rofi-unwrapped = prev.rofi-wayland-unwrapped; };
  })];

  programs.rofi = {
    enable = true;
    cycle = true;

    extraConfig = {
      modi = "drun,calc,emoji,window,run";
    };
    package = pkgs.rofi-wayland;
    plugins = [      
      pkgs.rofi-calc
      pkgs.rofi-emoji
    ];

    theme = {
      "*" = {
        background-color = mkLiteral "#00000001";
        text-color = txt;
      };
      "configuration" = {
        display-drun = "⬤";
        drun-display-format = "{name}";
        disable-history = false;
        click-to-exit = true;
        location = 0;
      };

      "window" = {
          transparency = "real";
          # border = mkLiteral "2px";
          # border-color = accent;
          border-radius = mkLiteral "10px";
          # width = mkLiteral "300px";
          fullscreen = true;
          anchor = "center";
          x-offset = 0;
          y-offset = 0;
      };

      "entry" = {
          enabled = true;
          expand = true;
          horizontal-align = 0;
          placeholder = "Search...";
          blink = true;
          border = mkLiteral "1px 0px 1px 0px";
          border-color = accent;
          border-radius = mkLiteral "10px";
          padding = mkLiteral "8px";
          text-color = txt_accent;
      };

      "inputbar" = {
        enabled = true;
        children = [ "entry" ];
          expand = false;
          border = mkLiteral "0px 0px 0px 0px";
          border-radius = mkLiteral "0px";
          margin = mkLiteral "0px 0px 0px 0px";
          padding = mkLiteral "0px";
          position = mkLiteral "center";
      };

      # "case-indicator" = {
      #     spacing = 0;
      # };

      "listview" = {
        background-color = bg;

        border-radius = mkLiteral "10px";
        border = mkLiteral "1px";
        border-color = accent;

        columns = 1;
        lines = 7;
        spacing = mkLiteral "4px";
        cycle = true;
        dynamic = true;
        layout = mkLiteral "vertical";
      };

      "mainbox" = {
          children = [ "inputbar" "listview" ];
          spacing = mkLiteral "5px";
          padding = mkLiteral "15px";
          margin = mkLiteral "29.5% calc(50% - 20ch)";
      };

      "element" = {
          orientation = mkLiteral "horizontal";
          border-radius = mkLiteral "10px";
          padding = mkLiteral "6px 6px 6px 6px";
      };

      # "element-icon" = {
      #     horizontal-align = mkLiteral "0.5";
      #     vertical-align = mkLiteral "0.5";
      #     size = mkLiteral "24px";
      #     border = mkLiteral "0px";
      # };

      # "element-text" = {
      #     text-color = txt;
      #     expand = true;
      #     horizontal-align = 0;
      #     vertical-align = mkLiteral "0.5";
      #     margin = mkLiteral "2px 0px 2px 2px";
      # };

      "element selected" = {
          # background-color = accent;
          text-color = txt_accent;
          border = mkLiteral "0px 0px 0px 0px";
          border-radius = mkLiteral "10px";
      };
      "element-text" = {
        text-color = mkLiteral "inherit";
        horizontal-align = mkLiteral "0.5";
      };
    };
  };
}