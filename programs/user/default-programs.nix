{ pkgs, inputs, ... }:
{
  imports = [
    ./kitty.nix
    ./fish.nix
    ./git.nix
  ];

  home.packages = [
    pkgs.whatsapp-for-linux
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
