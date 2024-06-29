{ pkgs, config, ... }:
let 
  browser = "firefox";
  terminal = "kitty";
  file-manager = "nautilus";
in
{
  imports = [
    ./rofi.nix
    ./waybar.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    systemd.enableXdgAutostart = true;  
    
    settings = {
      bind = [
        # Execute
        "SUPER, T, exec, ${terminal}"
        "SUPER, W, exec, ${browser}"
        "SUPER, F, exec, ${file-manager}"

        # Basics
        "SUPER, Q, killactive"

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
        "SUPER, Left, workspace, -1"
        "SUPER, Right, workspace, +1"
        "SUPER+SHIFT, Left, movetoworkspace, -1"
        "SUPER+SHIFT, Right, movetoworkspace, +1"
        "SUPER+SHIFT+ALT, Left, movetoworkspacesilent, -1"
        "SUPER+SHIFT+ALT, Right, movetoworkspacesilent, +1"
      ];
      bindel = [
        # Audio keys
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ];

      # decoration = {

      #   blur = {
      #   };
      # };
      exec-once = [
        "kitty"
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
        "sensitivity" = "0"; # -1.0 - 1.0, 0 means no modification.
        touchpad = {
            "natural_scroll" = "true";
            scroll_factor = 0.5;
        };
      };

      # layerrule = [
      #   "blur, rofi"
      # ];

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
        "forceinput, class:(Rofi)"
        
      ];

      ## LAPTOP POWER MANAGEMENT ##
      decoration.blur.enabled = false;
      decoration.drop_shadow = false;
      misc.vfr = true;
    };
  };  
}