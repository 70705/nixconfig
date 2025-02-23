{
  pkgs,
  lib,
  config,
  ...
}:

let
  cfg = config.modules.home.media.mpv;
  shaders = "${pkgs.mpv-shim-default-shaders}/share/mpv-shim-default-shaders/shaders/";
  ssimsuperres = pkgs.fetchgit {
    url = "https://gist.github.com/igv/2364ffa6e81540f29cb7ab4c9bc05b6b";
    rev = "15d93440d0a24fc4b8770070be6a9fa2af6f200b";
    sha256 = "1xj4r54i0y03hnyjvwaqb7lpn6k0anyblqb1fqj7k9ijambwqava";
  };

in
{
  options.modules.home.media.mpv = {
    enable = lib.mkEnableOption "mpv";
  };

  config = lib.mkIf cfg.enable {
    programs.mpv = {
      enable = true;
      bindings = {
        # cycle between shaders
        g = ''cycle-values glsl-shaders "${shaders}nnedi3-nns128-win8x6.hook" "${shaders}FSRCNNX_x2_8-0-4-1.glsl" "${ssimsuperres}/SSimSuperRes.glsl" ""'';

        # restyle subtitles by pressing k
        k = ''cycle_values sub-ass-override "force" "no"'';

        WHEEL_UP = "add volume 5";    # forward
        WHEEL_DOWN = "add volume -5";    # backward
        # Seek by exactly 30s instead of relative+keyframes 60s
        UP = "seek 30 exact";           # forward
        DOWN = "seek -30 exact";           # backward
        TAB = "script-binding skip-to-silence";

        d = "cycle deband                                                            #! Video > Filters > Toggle Deband";

        MOUSE_BTN2 = "script-binding uosc/menu-blurred";
        "ALT+a" = ''script-message-to uosc show-submenu-blurred "File"'';
        "ALT+z" = ''script-message-to uosc show-submenu-blurred "Audio"'';
        "ALT+x" = ''script-message-to uosc show-submenu-blurred "Subtitles"'';
        "ALT+s" = ''script-message-to uosc show-submenu-blurred "Video > Shaders"'';

        h = "script-binding memo-history                                                            #! File > History";
        "ALT+c" = "script-binding uosc/chapters                                                     #! File > Chapters";
        b = "script-binding uosc/open-file                                                          #! File > Open File";

        y = "script-binding uosc/load-subtitles                                                        #! Subtitles > Load";
        Y = "script-binding uosc/subtitles                                                             #! Subtitles > Select";
        "ALT+j" = "add sub-scale +0.05                                                                   #! Subtitles > Bigger";
        "ALT+k" = "add sub-scale -0.05                                                                   #! Subtitles > Smaller";
        z = "add sub-delay -0.1                                                                        #! Subtitles > Decrease Sub Delay";
        Z = "add sub-delay  0.1                                                                        #! Subtitles > Increase Sub Delay";

        # Optimized shaders for higher-end GPU
        "CTRL+1" = ''no-osd change-list glsl-shaders set "${shaders}Anime4K_Clamp_Highlights.glsl:${shaders}Anime4K_Restore_CNN_VL.glsl:${shaders}Anime4K_Upscale_CNN_x2_VL.glsl:${shaders}Anime4K_AutoDownscalePre_x2.glsl:${shaders}Anime4K_AutoDownscalePre_x4.glsl:${shaders}Anime4K_Upscale_CNN_x2_M.glsl"; show-text "Anime4K: Mode A (HQ)"                                   #! Video > Shaders > Profiles > Anime4K: Mode A (HQ)'';
        "CTRL+2" = ''no-osd change-list glsl-shaders set "${shaders}Anime4K_Clamp_Highlights.glsl:${shaders}Anime4K_Restore_CNN_Soft_VL.glsl:${shaders}Anime4K_Upscale_CNN_x2_VL.glsl:${shaders}Anime4K_AutoDownscalePre_x2.glsl:${shaders}Anime4K_AutoDownscalePre_x4.glsl:${shaders}Anime4K_Upscale_CNN_x2_M.glsl"; show-text "Anime4K: Mode B (HQ)"                                   #! Video > Shaders > Profiles > Anime4K: Mode B (HQ)'';
        "CTRL+3" = ''no-osd change-list glsl-shaders set "${shaders}Anime4K_Clamp_Highlights.glsl:${shaders}Anime4K_Upscale_Denoise_CNN_x2_VL.glsl:${shaders}Anime4K_AutoDownscalePre_x2.glsl:${shaders}Anime4K_AutoDownscalePre_x4.glsl:${shaders}Anime4K_Upscale_CNN_x2_M.glsl"; show-text "Anime4K: Mode C (HQ)"                                   #! Video > Shaders > Profiles > Anime4K: Mode C (HQ)'';
        "CTRL+4" = ''no-osd change-list glsl-shaders set "${shaders}Anime4K_Clamp_Highlights.glsl:${shaders}Anime4K_Restore_CNN_VL.glsl:${shaders}Anime4K_Upscale_CNN_x2_VL.glsl:${shaders}Anime4K_Restore_CNN_M.glsl:${shaders}Anime4K_AutoDownscalePre_x2.glsl:${shaders}Anime4K_AutoDownscalePre_x4.glsl:${shaders}Anime4K_Upscale_CNN_x2_M.glsl"; show-text "Anime4K: Mode A+A (HQ)"                                   #! Video > Shaders > Profiles > Anime4K: Mode A+A (HQ)'';
        "CTRL+5" = ''no-osd change-list glsl-shaders set "${shaders}Anime4K_Clamp_Highlights.glsl:${shaders}Anime4K_Restore_CNN_Soft_VL.glsl:${shaders}Anime4K_Upscale_CNN_x2_VL.glsl:${shaders}Anime4K_AutoDownscalePre_x2.glsl:${shaders}Anime4K_AutoDownscalePre_x4.glsl:${shaders}Anime4K_Restore_CNN_Soft_M.glsl:${shaders}Anime4K_Upscale_CNN_x2_M.glsl"; show-text "Anime4K: Mode B+B (HQ)"                                   #! Video > Shaders > Profiles > Anime4K: Mode B+B (HQ)'';
        "CTRL+6" = ''no-osd change-list glsl-shaders set "${shaders}Anime4K_Clamp_Highlights.glsl:${shaders}Anime4K_Upscale_Denoise_CNN_x2_VL.glsl:${shaders}Anime4K_AutoDownscalePre_x2.glsl:${shaders}Anime4K_AutoDownscalePre_x4.glsl:${shaders}Anime4K_Restore_CNN_M.glsl:${shaders}Anime4K_Upscale_CNN_x2_M.glsl"; show-text "Anime4K: Mode C+A (HQ)"                                   #! Video > Shaders > Profiles > Anime4K: Mode C+A (HQ)'';

        "CTRL+9" = ''no-osd change-list glsl-shaders set "${ssimsuperres}/SSimSuperRes.glsl:${shaders}KrigBilateral.glsl"; show-text "GLSL shaders cleared";                                   #! Video > Shaders > Profiles > Default Shaders'';
        "CTRL+0" = "no-osd change-list glsl-shaders clr all                                                          #! Video > Shaders > Clear All";
        F = "script-binding quality_menu/video_formats_toggle  #! Quality > Video";
        "Alt+f" = "script-binding quality_menu/audio_formats_toggle #! Quality > Audio";
      };

      extraInput = ''
        # script-binding uosc/show-in-directory                                                      #! File > Open in File Explorer
        # script-binding uosc/video                                                                 #! Video > Select Video Track
        # script-binding uosc/playlist                                                              #! File > Playlist
        # apply-profile Deband-Medium                                                               #! Video > Filters > Deband (Medium)
        # apply-profile Deband-Strong                                                               #! Video > Filters > Deband (Strong)
        # script-binding uosc/audio                                                                 #! Audio > Select Audio Track
        # script-binding uosc/open-config-directory                                                 #! Utilities > Settings
        # script-binding uosc/update                                                                #! Utilities > Update uosc
        / script-binding console/enable                                                             #! Utilities > Console

        MBTN_LEFT       cycle pause
        MBTN_LEFT_DBL   cycle fullscreen
      '';

      config = {
        profile="high-quality";
        vo="gpu-next";

        gpu-api="vulkan";

        hwdec="auto-copy";
        hwdec-codecs="all";
        script-opts="ytdl_hook-ytdl_path=${pkgs.yt-dlp}/bin/yt-dlp";

        scale="ewa_lanczos4sharpest";
        dscale="catmull_rom";
        cscale="ewa_lanczos4sharpest";
        glsl-shader = [ 
          "${ssimsuperres}/SSimSuperRes.glsl"
          "${shaders}KrigBilateral.glsl" 
        ];
        
        # Dither
        # This must be set to match your monitor's bit depth
        # fruit: 8-Bit/8-Bit+FRC display
        # ordered: true 10-Bit/12-Bit display
        # error-diffusion: high-end GPUs
        dither="fruit";
        dither-depth="auto";

        ## Behavior (personal preference)
        osd-bar="no";
        border="no";
        volume-max=300;
        autofit="90%";
        snap-window="yes";
        keep-open="yes";
        #keepaspect-window=no
        input-doubleclick-time=200;
        sub-scale = 0.75;

        ###### Antiring
        scale-antiring=0.5;
        dscale-antiring=0.5;
        cscale-antiring=0.5;
        
        ###### Debanding
        deband="no";
        deband-iterations=4;
        deband-threshold=48;
        deband-range=24;
        deband-grain=16;

        ## Screenshots
        screenshot-format="webp";
        screenshot-webp-lossless="yes";
        screenshot-high-bit-depth="yes";
        screenshot-sw="no";
        screenshot-dir="~/Pictures/mpv";
        screenshot-template="%f-%wH.%wM.%wS.%wT-#%#00n";

        ## Language Priority
        ## Sub
        ## Add enm before eng for honorifics
        slang="eng,en,por";
      };

      profiles = {
        "Deband-Medium" = {
          deband-iterations=2;
          deband-threshold=64;
          deband-range=16;
          deband-grain=24;
        };

        "Deband-Strong" = {
          deband-iterations=3;
          deband-threshold=64;
          deband-range=16;
          deband-grain=24;
        };

        "8bitDeband" = {
          profile-cond=''p["video-params/pixelformat"] == "yuv420p"'';
          deband="yes";
          profile-restore="copy";
        };

        "Only420chromaUpscale" = {
          profile-desc=''cond:((p["video-params/pixelformat"] == "yuv420p10" or p["video-params/pixelformat"] == "yuv420p"))'';
          glsl-shader="${shaders}KrigBilateral.glsl";
          profile-restore="copy";
        };

        "not1080pbut720pOrHigher" = {
          profile-desc=''cond:((p["video-params/h"] >= 720 and p["video-params/h"] < 1080))'';
          glsl-shader="${shaders}FSRCNNX_x2_8-0-4-1.glsl";
          profile-restore="copy";
        };

        "WebdlDeband" = {
          profile-cond=''string.match(p.filename, "%[Web%-DL%]")~=nil'';
          deband="yes";
          profile-restore="copy";
        };

        "crunchyroll" = {
          profile-cond=''filename:match("SubsPlease") or filename:match("Erai%-raws") or filename:match("HorribleSubs")'';
          profile-restore="copy";
          sub-ass-use-video-data="aspect-ratio";
        };

        "simulcast" = {
          profile-cond=''(function(a)for b,c in ipairs(a)do if filename:match(c)then return true end end end)({"SubsPlease","Erai%-raws","Tsundere%-Raws","%-VARYG","HorribleSubs","SubsPlus%+", "Yameii"})'';
          profile-restore="copy";
          deband="yes";
        };
      };

      scripts = with pkgs.mpvScripts; [
        uosc
        (quality-menu.override { oscSupport = true; })
        thumbfast
        videoclip
        smart-copy-paste-2
        memo
        evafast
        mpv-playlistmanager
      ];

      scriptOpts = {
        quality-menu = {
          ytdl_ver = "yt-dlp";
        };
        thumbfast = {
          network = "yes";
          hwdec = "yes";
        };
      };
    };
  };
}
