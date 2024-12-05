{
  pkgs,
  inputs,
  lib,
  config,
  ...
}:

let
  cfg = config.modules.home.wm.hypr;
  toggleterm = pkgs.writeShellScriptBin "toggleterm" ''hyprctl dispatch exec "[workspace special:term silent] foot -a kterm"'';
  audiorelay = pkgs.writeShellScriptBin "audiorelay" ''hyprctl dispatch exec "[workspace special:minimized silent] audiorelay"'';
in
{
  options.modules.home.wm.hypr = {
    enable = lib.mkEnableOption "hypr";
  };

  config = lib.mkIf cfg.enable {
    stylix.targets.hyprland.enable = false;
    wayland.windowManager.hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      systemd.variables = [ "--all" ];
      settings = {
        autogenerated = 0;
        monitor = ",highrr,auto,1";
        "$terminal" = "foot";
        "$fileManager" = "yazi";
        "$menu" = "fuzzel";

        exec-once = [
          "${toggleterm}/bin/toggleterm"
          "qbittorrent --no-splash"
          "clipse -listen"
          "sleep 3; keepassxc ~/Downloads/KeePass/Senhas.kdbx"
          #        "ANKI_WAYLAND=1 anki"
          "emacs-29.4 --daemon"
        ];

        env = [
          "XCURSOR_SIZE,${toString config.stylix.cursor.size}"
          "HYPRCURSOR_SIZE,${toString config.stylix.cursor.size}"
        ];

        general = {
          gaps_in = 3;
          gaps_out = 10;
          border_size = 2;

          snap = {
            enabled = true;
          };

          # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
          "col.active_border" = "rgb(c1c1c1) rgb(999999) 45deg";
          "col.inactive_border" = "rgba(595959aa)";

          # Set to true enable resizing windows by clicking and dragging on borders and gaps
          resize_on_border = false;

          # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
          allow_tearing = true;

          layout = "master";
        };

        decoration = {
          rounding = 0; # 10

          # Change transparency of focused and unfocused windows
          active_opacity = 0.94;
          inactive_opacity = 0.94;

          shadow = {
            enabled = true;
            range = 4;
            render_power = 3;
            color = "rgba(1a1a1aee)";
          };

          # https://wiki.hyprland.org/Configuring/Variables/#blur
          blur = {
            enabled = true;
            size = 12;
            passes = 1;
            new_optimizations = true;

            vibrancy = 0.1696;
          };
        };

        render = {
          explicit_sync = false;
        };

        cursor = {
          inactive_timeout = 5;
          zoom_rigid = true;
        };

        binds = {
          scroll_event_delay = 0;
        };

        animations = {
          enabled = true;

          # Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

          bezier = [
            "windowsBezier, 0.33, 1, 0.68, 1"
            "workspacesBezier, 0.02, 0.73, 0.01, 0.99"
          ];

          animation = [
            "windows, 1, 4, windowsBezier,popin"
            "windowsOut, 1, 7, windowsBezier, popin 80%"
            "border, 1, 10, default"
            "borderangle, 1, 8, default"
            "fade, 1, 7, default"
            "workspaces, 1, 5, workspacesBezier, slide"
          ];
        };

        #experimental {
        #    explicit_sync = true
        #}

        # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
        dwindle = {
          pseudotile = true; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
          preserve_split = true; # You probably want this
        };

        # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
        master = {
          new_status = "slave";
          mfact = 0.6;
          new_on_active = "after";
          smart_resizing = true;
          orientation = "left";
        };

        # https://wiki.hyprland.org/Configuring/Variables/#misc
        misc = {
          middle_click_paste = false;
          force_default_wallpaper = 0; # Set to 0 or 1 to disable the anime mascot wallpapers
          disable_hyprland_logo = true;
        };

        # https://wiki.hyprland.org/Configuring/Variables/#input
        input = {
          kb_layout = "br";
          kb_variant = "";
          kb_model = "";
          kb_options = "";
          kb_rules = "";
          numlock_by_default = true;

          follow_mouse = 1;
          accel_profile = "flat";

          sensitivity = 0; # -1.0 - 1.0, 0 means no modification.

          touchpad = {
            natural_scroll = false;
          };
        };

        # https://wiki.hyprland.org/Configuring/Variables/#gestures
        gestures = {
          workspace_swipe = false;
        };

        # Example per-device config
        # See https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs for more
        device = {
          name = "epic-mouse-v1";
          sensitivity = -0.5;
        };
      };

      extraConfig = ''
        ####################
        ### KEYBINDINGSS ###
        ####################

        # See https://wiki.hyprland.org/Configuring/Keywords/
        $mainMod = SUPER # Sets "Windows" key as main modifier

        # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
        bind = $mainMod, Return, exec, $terminal
        bind = $mainMod, Escape, exec, wlogout
        bind = $mainMod, Q, killactive,
        bind = $mainMod, S, togglefloating,
        bind = $mainMod, Space, exec, $menu
        bind = $mainMod, F, fullscreen
        bind = $mainMod, P, pseudo, # dwindle
        bind = $mainMod, J, togglesplit, # dwindle
        bind = $mainMod, C, exec, foot -T clipse -a clipse clipse

        # Resize mode
        bind = $mainMod, R,submap,resize
        submap = resize

        # sets repeatable binds for resizing the active window
        binde =,right,resizeactive,40 0
        binde =,left,resizeactive,-40 0
        binde =,up,resizeactive,0 -40
        binde =,down,resizeactive,0 40

        # use reset to go back to the global submap
        bind=,escape,submap,reset

        # will reset the submap, which will return to the global submap
        submap=reset

        # Master layout binds
        bind = $mainMod, M, layoutmsg, swapwithmaster master
        bind = $mainMod, N, layoutmsg, removemaster
        bind = $mainMod, B, layoutmsg, addmaster

        # Moving window to previous or next workspace
        bind = $mainMod CTRL, left, movetoworkspacesilent, -1
        bind = $mainMod CTRL, right, movetoworkspacesilent, +1

        # Moving windows with mainMod + SHIFT + arrow keys
        bind = $mainMod SHIFT, left, movewindow, l
        bind = $mainMod SHIFT, right, movewindow, r
        bind = $mainMod SHIFT, up, movewindow, u
        bind = $mainMod SHIFT, down, movewindow, d

        # Move to previous/next workspace with mainMod + ALT + arrow keys
        bind = $mainMod ALT, left, workspace, -1
        bind = $mainMod ALT, right, workspace, +1

        # Move focus with mainMod + arrow keys
        bind = $mainMod, left, movefocus, l
        bind = $mainMod, right, movefocus, r
        bind = $mainMod, up, movefocus, u
        bind = $mainMod, down, movefocus, d

        # Switch workspaces with mainMod + [0-9]
        bind = $mainMod, 1, workspace, 1
        bind = $mainMod, 2, workspace, 2
        bind = $mainMod, 3, workspace, 3
        bind = $mainMod, 4, workspace, 4
        bind = $mainMod, 5, workspace, 5
        bind = $mainMod, 6, workspace, 6
        bind = $mainMod, 7, workspace, 7
        bind = $mainMod, 8, workspace, 8
        bind = $mainMod, 9, workspace, 9
        bind = $mainMod, 0, workspace, 10

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        bind = $mainMod SHIFT, 1, movetoworkspace, 1
        bind = $mainMod SHIFT, 2, movetoworkspace, 2
        bind = $mainMod SHIFT, 3, movetoworkspace, 3
        bind = $mainMod SHIFT, 4, movetoworkspace, 4
        bind = $mainMod SHIFT, 5, movetoworkspace, 5
        bind = $mainMod SHIFT, 6, movetoworkspace, 6
        bind = $mainMod SHIFT, 7, movetoworkspace, 7
        bind = $mainMod SHIFT, 8, movetoworkspace, 8
        bind = $mainMod SHIFT, 9, movetoworkspace, 9
        bind = $mainMod SHIFT, 0, movetoworkspace, 10

        # scratchpad

        bind = $mainMod, V, movetoworkspacesilent, special:minimized
        bind = $mainMod, H, togglespecialworkspace, minimized
        bind = $mainMod, H, submap, minimized
        submap = minimized
        bind = , left, movefocus, l
        bind = , right, movefocus, r
        bind = , up, movefocus, u
        bind = , down, movefocus, d
        bind = , Q, killactive
        bind = , Return, movetoworkspace, +0
        bind = , Return, submap, reset
        bind = , mouse:272, movetoworkspace, +0
        bind = , mouse:272, submap, reset
        bind = , escape, togglespecialworkspace, minimized
        bind = , escape, submap, reset
        submap = reset

        #bind = $mainMod, T, togglespecialworkspace, term

        bind = $mainMod, T, togglespecialworkspace, term
        bind = $mainMod, T, movetoworkspace, +0
        bind = $mainMod, T, togglespecialworkspace, term
        bind = $mainMod, T, movetoworkspace, special:term
        bind = $mainMod, T, togglespecialworkspace, term

        # Scroll through existing workspaces with mainMod + scroll
        bind = $mainMod, mouse_down, workspace, e+1
        bind = $mainMod, mouse_up, workspace, e-1

        # Move/resize windows with mainMod + LMB/RMB and dragging
        bindm = $mainMod, mouse:272, movewindow
        bindm = $mainMod, mouse:273, resizewindow

        # Audio binds
        bind =, XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_SINK@ 10%+
        bind =, XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_SINK@ 10%-
        bind =, XF86AudioMute, exec, wpctl set-mute @DEFAULT_SINK@ toggle
        bind =, XF86AudioPlay, exec, playerctl play-pause
        bind =, Insert, exec, wpctl set-mute @DEFAULT_SOURCE@ toggle

        # Utils
        bind = , PRINT, exec, hyprshot -m region output --clipboard-only

        bind = $mainMod, O, exec, hyprctl setprop active opaque toggle

        ##############################
        ### WINDOWS AND WORKSPACES ###
        ##############################

        # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
        # See https://wiki.hyprland.org/Configuring/Workspace-Rules/ for workspace rules

        # Example windowrule v1
        # windowrule = float, ^(kitty)$

        # Example windowrule v2
        # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$

        windowrulev2 = suppressevent maximize, class:.* # You'll probably like this.

        # windowrulev2 = workspace special:minimized,noinitialfocus,class:(com-azefsw-audioconnect-desktop-app-MainKt)

        windowrulev2 = plugin:hyprbars:nobar,floating:0

        windowrulev2 = workspace 1 silent,class:(firefox)
        windowrulev2 = workspace 2 silent,class:(steam|vesktop)
        windowrulev2 = workspace 3,class:(steam_app_.*|.*\.exe.*|osu!|hoi4|org.libretro.RetroArch)
        windowrulev2 = workspace 4 silent,class:(anki)

        windowrulev2 = fullscreen,class:(steam_app_.*|.*\.exe.*|osu!|org.libretro.RetroArch|hoi4)

        windowrulev2 = size 800 450, title:(Picture-in-Picture)
        windowrulev2 = float, title:^(Picture-in-Picture)$
        windowrulev2 = pin, title:^(Picture-in-Picture)$

        windowrulev2 = size 1152 870, class:(kterm)
        windowrulev2 = float, class:^(kterm)$
        windowrulev2 = immediate,class:^(Rhythia)$

        windowrulev2 = float,center,class:(pavucontrol|pcmanfm|clipse|io.github.Qalculate.qalculate-qt|.*KeePassXC.*)
        windowrulev2 = size 950 657,class:(clipse)

        windowrulev2 = opacity 1.0 override 1.0 override,class:(org.libretro.RetroArch|pinta|mpv|anki|org.nomacs.ImageLounge)
        windowrulev2 = opacity 1.0 override 1.0 override,title:(Picture-in-Picture|.*\- YouTube.*)
        windowrulev2 = opacity 1.0 override 1.0 override,title:(.*\- Twitch.*)

        layerrule = dimaround, launcher
        layerrule = blur, launcher
      '';
    };

    home.packages = with pkgs; [
      hyprshot
      clipse
      wl-clipboard
    ];
  };
}
