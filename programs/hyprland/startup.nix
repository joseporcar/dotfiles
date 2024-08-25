{ pkgs }:
pkgs.writeShellScriptBin "startup" ''
  zapzap &
  firefox &
''