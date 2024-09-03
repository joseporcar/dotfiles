{ config, pkgs, inputs, ... }:

{
  imports = 
  [
    ./../../programs/user/programs.nix
    ./../../programs/hyprland/hyprland.nix
  ];
      
  gtk = {
    enable = true;
    gtk2.extraConfig = "gtk-theme-name = catppuccin-macchiato";
    gtk3.extraConfig = {gtk-theme-name = "catppuccin-macchiato";};
    gtk4.extraConfig = {gtk-theme-name = "catppuccin-macchiato";};
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
  };

# Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "pcpronix";
  home.homeDirectory = "/home/pcpronix";
  
  nixpkgs.config.allowUnfree = true;
  home.stateVersion = "24.05"; 
  programs.home-manager.enable = true;
}
