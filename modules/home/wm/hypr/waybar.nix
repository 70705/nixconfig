{
  lib,
  config,
  ...
}:

{

  stylix.targets.waybar.enable = false;
  programs.waybar = {
    enable = lib.mkIf config.modules.home.wm.hypr.enable true;
    systemd.enable = lib.mkIf config.modules.home.wm.hypr.enable true;

    settings = [
      {
        # "layer" = "top", # Waybar at top layer
        # "position" = "bottom", # Waybar position (top|bottom|left|right)
        height = 10; # Waybar height (to be removed for auto height)
        # "width" = 1280, # Waybar width

        # Choose the order of the modules
        modules-left = [
          "hyprland/workspaces"
          "hyprland/mode"
        ];
        modules-center = [ "hyprland/window" ];
        modules-right = [
          "cpu"
          "memory"
          "network"
          "pulseaudio"
          "clock#date"
          "clock#time"
          "tray"
          "idle_inhibitor"
          "custom/wlogout"
        ];

        # Modules configuration
        # "hyprland/workspaces" = {
        # 	"disable-scroll" = true,
        # 	"all-outputs" = true,
        # 	format = "{name}: {icon}",
        # 	format-icons = {
        # 		"1" = "",
        # 		"2" = "",
        # 		"3" = "",
        # 		"4" = "",
        # 		"5" = "",
        # 		"urgent" = "",
        # 		"focused" = "",
        # 		"default" = ""
        # 	}
        # };

        "custom/wlogout" = {
          format = "{}";
          on-click = "wlogout";
        };

        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
        };
        "hyprland/window" = {
          max-length = 70;
        };
        "temperature" = {
          # "thermal-zone" = 2,
          # "hwmon-path" = "/sys/class/hwmon/hwmon2/temp1_input",
          critical-threshold = 80;
          # "format-critical" = "{temperatureC}°C {icon}",
          format = "<span color='#e88939'>{icon}</span> {temperatureC}°C";
          format-icons = [
            ""
            ""
            ""
          ];
        };
        "cpu" = {
          format = "   {usage}% ";
          tooltip = false;
        };
        "memory" = {
          format = "   {}% ";
        };
        "network" = {
          #"interface" = "wlp2*", # (Optional) To force the use of this interface
          format-wifi = " {essid} ({signalStrength}%)";
          format-ethernet = " {ifname}: {ipaddr}/{cidr}";
          format-linked = " {ifname} (No IP)";
          format-disconnected = "󰈂 Disconnected";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
        };

        "pulseaudio" = {
          scroll-step = 5; # %, can be a float
          format = "  {volume}%  {format_source}";
          format-bluetooth = "  {volume}%  {format_source}";
          format-bluetooth-muted = "  {format_source}";
          format-muted = "  {format_source}";
          format-source = " {volume}%";
          format-source-muted = " ";
          on-click = "pavucontrol";
        };

        "clock#time" = {
          interval = 1;
          format = "  {:%H:%M:%S}";
          tooltip-format = "{:%Y-%m-%d | %H:%M:%S}";
          # "format-alt" = "{:%Y-%m-%d}";
        };
        "clock#date" = {
          interval = 10;
          format = "󰃭  {:%e %b %Y}";
          tooltip-format = "{:%e %B %Y}";
        };

        "tray" = {
          icon-size = 16;
          spacing = 10;
        };
        "mpd" = {
          format = "{stateIcon} {consumeIcon}{randomIcon}{repeatIcon}{singleIcon}{artist} - {album} - {title} ({elapsedTime:%M:%S}/{totalTime:%M:%S}) ";
          format-disconnected = "Disconnected ";
          format-stopped = "{consumeIcon}{randomIcon}{repeatIcon}{singleIcon}Stopped ";
          unknown-tag = "N/A";
          interval = 2;
          "consume-icons" = {
            on = " ";
          };
          "random-icons" = {
            off = "<span color=\"#f53c3c\"></span> ";
            on = " ";
          };
          "repeat-icons" = {
            on = " ";
          };
          "single-icons" = {
            on = "1 ";
          };
          "state-icons" = {
            paused = "";
            playing = "";
          };
          tooltip-format = "MPD (connected)";
          tooltip-format-disconnected = "MPD (disconnected)";
        };
      }

    ];

    style = ''
      * {
      	border: none;
      	border-radius: 0;
        font-family: "Roboto Mono Medium", Helvetica, Arial, sans-serif;
      	font-size: 11px;
      	min-height: 0;
      	margin: 0px;
      }

      window#waybar {
        background-color: rgba(0, 0, 0, 0.9);
      	/*background: rgba(0, 0, 0, 0.7);*/
      	color: gray;
      	color: #ffffff;
      }

      #window {
      	color: #e4e4e4;
      	font-weight: bold;
      }

      #workspaces {
      	padding: 0px;
      	margin: 0px;
      }

      #workspaces button {
          /* padding: 0 0.4em; */
          /* background-color: transparent; */
          color: #ffffff;
          /* Use box-shadow instead of border so the text isn't offset */
          box-shadow: inset 0 -3px transparent;
      }

      /* https:#github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
      #workspaces button:hover {
          background: rgba(0, 0, 0, 0.9);
          box-shadow: inset 0 -3px #ffffff;
      }

      #workspaces button.active {
          box-shadow: inset 0 -3px #fffff0;
      }

      #workspaces button.focused {
          background-color: #64727D;
          /* box-shadow: inset 0 -3px #ffffff; */
      }

      #workspaces button.urgent {
          background-color: #eb4d4b;
      }

      #mode {
      	background: #af005f;
      	color: #1b1d1e;
      }
      #clock, #battery, #cpu, #memory, #network, #pulseaudio, #mode, #tray {
      	padding: 0 6px;
      	margin: 6px 4px;
      }

      #custom-wlogout, #idle_inhibitor {
      	padding: 0 3px;
      	margin: 6px 7px 6px 4px;
      }

      @keyframes blink {
          to {
              background-color: #af005f;
          }
      }

      #network.disconnected {
          background: #f53c3c;
      }

      #custom-spotify {
          color: rgb(102, 220, 105);
      }
    '';
  };

}
