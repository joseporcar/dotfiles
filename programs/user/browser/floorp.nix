{ pkgs, lib, config, ...}:
{
  options.floorp.enable = lib.mkEnableOption "enable floorp";
  
  config = lib.mkIf config.floorp.enable {
    home.packages = [ pkgs.floorp ];
  };
}