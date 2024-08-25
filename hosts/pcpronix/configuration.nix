# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./../../programs/hyprland/hyprland-sys.nix
      ./../../programs/system/default-programs.nix
      inputs.home-manager.nixosModules.default
    ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  stylix = {
    enable = true;
    # Wallpapers: 
    # forest = https://wallpapersden.com/minimal-hd-landscape-wallpaper/
    image = ./../../wallpapers/forest.jpg;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
    cursor = {
      package = pkgs.catppuccin-cursors.macchiatoRosewater;
      name = "catppuccin-macchiato-rosewater-cursors";
      size = 24;
    };
    fonts = {
      monospace = {
        package = pkgs.nerdfonts.override {fonts = [ "JetBrainsMono" ];};
        name = "JetBrains Mono";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    nix-output-monitor
    nvd
    grc
    powertop
  ];

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
      PLATFORM_PROFILE_ON_BAT="low-power";
    };
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  # Bootloader
  boot.loader.grub = {
    enable = true;
    device = "nodev";
    efiSupport = true;
  };
  # boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "ntfs" ];


  networking.hostName = "pcpronix"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Caracas";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_VE.UTF-8";
    LC_IDENTIFICATION = "es_VE.UTF-8";
    LC_MEASUREMENT = "es_VE.UTF-8";
    LC_MONETARY = "es_VE.UTF-8";
    LC_NAME = "es_VE.UTF-8";
    LC_NUMERIC = "es_VE.UTF-8";
    LC_PAPER = "es_VE.UTF-8";
    LC_TELEPHONE = "es_VE.UTF-8";
    LC_TIME = "es_VE.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "colemak_dh";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  hardware.graphics.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.pcpronix = {
    isNormalUser = true;
    description = "Jose Porcar";
    extraGroups = [ "networkmanager" "wheel" "video" ];
    shell = pkgs.fish;
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "pcpronix" = import ./home.nix;
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget


  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
