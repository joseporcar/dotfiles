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
  
  environment.systemPackages = with pkgs; [
    grc
    nix-output-monitor
    nvd
    powertop
    resources
  ];
  

}