{ pkgs, inputs, ... }:
{
  imports = [    
    ./git.nix
    ./vscode.nix
    ./fastfetch.nix
    ./browser/firefox.nix
    ./browser/floorp.nix    
    ./terminal/kitty.nix
    ./terminal/fish.nix
  ];
  floorp.enable = true;

  home.packages = [
    pkgs.zapzap
  ];
}
