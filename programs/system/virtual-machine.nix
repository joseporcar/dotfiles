{ pkgs, ...}:
{
  zirtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  home.pcpronix.dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };
}