{ pkgs, ...}: 
{
  services.swaync.enable = true;
  home.packages = [
    pkgs.hyprshot
  ];
}