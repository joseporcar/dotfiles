{ pkgs, ...}:
{
  ## LAPTOP POWER MANAGEMENT ##
  powerManagement.enable = true;
  services.power-profiles-daemon.enable = false;
  # powerManagement.cpuFreqGovernor = "powersave";
  services.tlp = {
    enable = true;
    # TODO battery care features https://linrunner.de/tlp/settings/battery.html
    # https://linrunner.de/tlp/settings/bc-vendors.html

    # TODO doesnt switch to batery when unplugged
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC="performance";
      CPU_ENERGY_PERF_POLICY_ON_AC="performance";
      PLATFORM_PROFILE_ON_AC="performance";
  
      CPU_ENERGY_PERF_POLICY_ON_BAT="power";
      CPU_SCALING_GOVERNOR_ON_BAT="powersave";
      PLATFORM_PROFILE_ON_BAT="cool";

      DEVICES_TO_DISABLE_ON_BAT_NOT_IN_USE="bluetooth";
    };
  };
}