{ config, pkgs, ...}: 
let 
  colors = config.lib.stylix.colors.withHashtag;
in
{ 
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainbar = {
        layer = "top";
        position = "top";
        height = 20;
        margin-top = 5;
        margin-right = 5;
        margin-left = 5;

        "modules-left" = [
          "hyprland/workspaces"
        ];
        "modules-center" = [
          "pulseaudio"
          "clock"
          "backlight"
        ];
        "modules-right" = [
          "hyprland/language"
          "battery"
        ];

        "hyprland/language" = {
          format = "{variant}";
          on-click = "hyprctl switchxkblayout at-translated-set-2-keyboard next";
        };
        "hyprland/workspaces" = {
          persistent-workspaces = {
            "*" = 5;
          };
          format = "{icon}";
          format-icons = {
            "active" = "";
            "default" = "";
            "whatsapp" = "";
            "special:special" = "";
          };
          show-special = true;
        };
      };
    };
    style = ''
      * {
        padding: 0 2;
        color: ${colors.base05}
      }
      #waybar {
        background: transparent;
      }
      #workspaces {
        font-size: 17;
      }
    '';
  };
}