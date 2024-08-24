{ pkgs }:
pkgs.writeShellScriptBin "startup" ''
  whatsapp-for-linux
  firefox 
''