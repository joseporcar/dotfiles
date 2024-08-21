{ pkgs, inputs, ... }:
{
  programs = {
    light = {
      enable = true;
      brightnessKeys = {
        enable = true;
        step = 5;
      };
    };

    fish = {
      enable = true;
    };  
    nh = {
      enable = true;
      flake = /home/pcpronix/nixos;
    };
  };
  home-manager.users.pcpronix.home.packages = [
    pkgs.resources
  ];

}