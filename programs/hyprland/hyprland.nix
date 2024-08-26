{ pkgs, config, ... }:
let 
  browser = "firefox";
  terminal = "kitty";
  file-manager = "nautilus";
  startupScript = import ./startup.nix {inherit pkgs;};
in
{
  imports = [
    ./rofi.nix
    ./waybar.nix
    ./programs.nix
  ];
# TODO fullscreen functionality
# TODO scroll functionality
# TODO Hiding waybar
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    systemd.enableXdgAutostart = true;  

    extraConfig = ''
      submap = resize 
      binde = , N, splitratio, -0.1
      binde = , I, splitratio, +0.1
      binde = , U, splitratio, -0.1
      binde = , E, splitratio, +0.1
      bind = , catchall, submap, reset
      submap = reset
    '';
    
    settings = {
      bind = [
        # Execute
        "SUPER, T, exec, ${terminal}"
        "SUPER, F, exec, ${file-manager}"
        "SUPER, B, exec, ${browser}"
    
        # Basics
        "SUPER, Q, killactive"

        # Screenshot @ clipboard
        ", Print, exec, hyprshot -m region -z --clipboard-only"
        "Shift, Print, exec, hyprshot -m active -m window -z --clipboard-only"
        "Control, Print, exec, hyprshot -m active -m output -z --clipboard-only"

        # Screenshot @ file
        "SUPER, Print, exec, hyprshot -m region -o ~/Pictures/Screenshots/ -z"
        "SUPER+Shift, Print, exec, hyprshot -m active -m window -o ~/Pictures/Screenshots/ -z"
        "SUPER+Control, Print, exec, hyprshot -m active -m output -o ~/Pictures/Screenshots/ -z"
        # Named (TODO)
        # "ALT, Print, exec (something to ask for prompt and then put that in hyprshot)
      ];
      bindr = [
        # rofi
        "SUPER,  SUPER_L, exec, pkill rofi || rofi -show drun"
      ];
      binde = [
        # Workspaces
        "SUPER, N, workspace, -1"
        "SUPER, I, workspace, +1"
        "SUPER+SHIFT, N, movetoworkspace, -1"
        "SUPER+SHIFT, I, movetoworkspace, +1"
        "SUPER+SHIFT+ALT, N, movetoworkspacesilent, -1"
        "SUPER+SHIFT+ALT, I, movetoworkspacesilent, +1"

        # Special
        "SUPER, S, togglespecialworkspace"
        "SUPER+SHIFT, S, movetoworkspace, special"
        "SUPER+SHIFT+ALT, S, movetoworkspacesilent, special"
        "SUPER+SHIFT, R, movetoworkspace, -0" 

        # Whatsapp
        "Super, W, togglespecialworkspace, whatsapp"

        # Resizing (submap in extraconfig)
        "SUPER, O, submap, resize"

        # Moving within workspace 
        "SUPER+Control, N, movewindow, l"
        "SUPER+Control, I, movewindow, r"
        "SUPER+Control, U, movewindow, u"
        "SUPER+Control, E, movewindow, d"

        # Moving focus
        "SUPER+ALT, N, movefocus, l"
        "SUPER+ALT, I, movefocus, r"
        "SUPER+ALT, U, movefocus, u"
        "SUPER+ALT, E, movefocus, d"
        
      ];
      bindel = [
        # Audio keys
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ];

      decoration = {
        rounding = 10;
        
        blur = {
          popups = true;
          size = 3;
          passes = 2;
          xray = true;

          ignore_opacity = false;
        };
      };

      dwindle = {
        smart_split = true;
      };

      exec-once = [
        "${startupScript}/bin/startup"
      ];
      
      general = {
        gaps_out = 5;
        gaps_in = 3;
        gaps_workspaces = 100;
      };
      gestures = {
        workspace_swipe = true;
        workspace_swipe_distance = 500;
        workspace_swipe_direction_lock = false;
        workspace_swipe_forever = false;
        workspace_swipe_cancel_ratio = 0.05;
      };
      
      input = {
        "kb_layout" = "us, us";
        "kb_variant" = "colemak_dh, altgr-intl";
        "kb_options" = "caps:backspace, grp:win_space_toggle, shift:both_capslock";
        "follow_mouse" = "1";
        "sensitivity" = "0";
        touchpad = {
            "natural_scroll" = "true";
            scroll_factor = 0.5;
        };
      };

      layerrule = [
        "blur, rofi"
        "ignorezero, rofi"
        "xray 0, rofi"
      ];

      # misc = {
      # };

      monitor = [
        "eDP-1, preferred, 0x0, 1"
        "desc:AOC Q27G2G4 0x00000693, 2560x1440@143.91Hz, 1366x-672, 1"
        ", preferred, auto, 1"
      ];

      windowrulev2 = [
        # rofi
        "pin, class:(Rofi)"

        "workspace special:whatsapp silent, class:(com.rtosta.zapzap)"        
        # kitty
        # "noblur, class:(kitty)"
      ];

      ## LAPTOP POWER MANAGEMENT ##
      # decoration.blur.enabled = false;
      # decoration.drop_shadow = false;
      misc.vfr = true;
    };
  };  
}
