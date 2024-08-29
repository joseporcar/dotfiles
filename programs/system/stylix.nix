{ inputs, pkgs, ...}:
{
  stylix = {
    enable = true;
    # Wallpapers: 
    # forest = https://wallpapersden.com/minimal-hd-landscape-wallpaper/
    image = ./../../wallpapers/forest.jpg;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
    cursor = {
      package = pkgs.catppuccin-cursors.macchiatoRosewater;
      name = "catppuccin-macchiato-rosewater-cursors";
      size = 24;
    };
    fonts = {
      monospace = {
        package = pkgs.nerdfonts.override {fonts = [ "JetBrainsMono" ];};
        name = "JetBrains Mono";
      };
    };
  };
}