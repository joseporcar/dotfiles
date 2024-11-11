{ pkgs, ... }: 
{
  programs.vscode = {
    enable = true;
    extensions = [
      pkgs.vscode-extensions.catppuccin.catppuccin-vsc
      pkgs.vscode-extensions.rust-lang.rust-analyzer
    ];
  };
  stylix.targets.vscode.enable = false;
}