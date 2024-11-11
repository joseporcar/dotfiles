{ pkgs, inputs, ... }:
{
  imports = [
    ./../../programs/system/stylix.nix
  ];
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
    inputs.zen-browser.packages."${system}".specific
    libreoffice
  ];
  programs.localsend = {
    enable = true;
    openFirewall = true;
  };
}