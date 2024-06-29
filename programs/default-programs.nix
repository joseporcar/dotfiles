{ pkgs, inputs, ... }:
{
  imports = [
    ./kitty.nix
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


  programs.git = {
    enable = true;
    userName  = "joseporcar";
    userEmail = "joseaporcar@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
