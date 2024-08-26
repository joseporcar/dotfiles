{ pkgs, inputs, ... }:
{
  imports = [
    ./kitty.nix
    ./fish.nix
    ./git.nix
  ];

  home.packages = [
    pkgs.zapzap

    # ew TODO remove after phisics C
    pkgs.google-chrome
  ];

  programs.firefox = {
    enable = true;
  };

  programs.vscode = {
    enable = true;
  };

  programs.fastfetch = {
    enable = true;
  };
}
