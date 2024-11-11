{ pkgs, config, lib, ...}:
let 
  username = config.networking.hostName;
in
{

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  home-manager.users.${username}.dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };
}