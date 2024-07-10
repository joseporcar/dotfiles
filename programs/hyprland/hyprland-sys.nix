{ inputs, pkgs, ...}:
{
  # environment.systemPackages = [
  #   (pkgs.waybar.overrideAttrs (oldAttrs: {
  #     mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ]
  #   }))
  # ];
  programs.hyprland = {
    enable = true; 
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    xwayland.enable = true;
  };
}