{ inputs, config, lib, pkgs, ... }:

let 
  cfg = config.nixModules.audio;
  pw_rnnoise_config = {
  "context.modules"= [
    { "name" = "libpipewire-module-filter-chain";
        "args" = {
            "node.description" = "Noise Canceling source";
            "media.name"       = "Noise Canceling source";
            "filter.graph" = {
                "nodes" = [
                    {
                        "type"   = "ladspa";
                        "name"   = "rnnoise";
                        "plugin" = "${pkgs.rnnoise-plugin}/lib/ladspa/librnnoise_ladspa.so";
                        "label"  = "noise_suppressor_stereo";
                        "control" = {
                            "VAD Threshold (%)" = 50.0;
                        };
                    }
                ];
            };
            "audio.position" = [ "FL" "FR" ];
            "capture.props" = {
                "node.name" = "effect_input.rnnoise";
                "node.passive" = true;
            };
            "playback.props" = {
                "node.name" = "effect_output.rnnoise";
                "media.class" = "Audio/Source";
            };
        };
    }
];
};

in
  {

    imports = [ inputs.nix-gaming.nixosModules.pipewireLowLatency ];

    options.nixModules.audio = {
      enable = lib.mkEnableOption "audio";
    };

    config = lib.mkIf cfg.enable {
      security.rtkit.enable = true;
      services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;

        lowLatency = { 
          enable = true;
          quantum = 1024;
          rate = 48000;
        };

        extraConfig.pipewire = {
          "99-input-denoising" = pw_rnnoise_config;
        };
      };
    };
  }
