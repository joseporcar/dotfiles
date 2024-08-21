{ pkgs }:
pkgs.writeShellScriptBin "startup" ''
  whatsapp-for-linux &
  sleep 2.7;
  hyprctl dispatch movetoworkspacesilent special:whatsapp,whatsapp-for-linux; 
''