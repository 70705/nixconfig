{
  pkgs,
  lib,
  config,
  ...
}:

let
  cfg = config.hmModules.media.mpv;
in
{
  options.hmModules.media.mpv = {
    enable = lib.mkEnableOption "mpv";
  };

  config = lib.mkIf cfg.enable {
    programs.mpv = {
      enable = true;
      bindings = {
        # Seek by exactly 5s instead of relative+keyframes 10s
        RIGHT = "seek  10 exact"; # forward
        LEFT = "seek -10 exact"; # backward
        WHEEL_UP = "add volume 5"; # forward
        WHEEL_DOWN = "add volume -5"; # backward
        # Seek by exactly 30s instead of relative+keyframes 60s
        UP = "seek  30 exact"; # forward
        DOWN = "seek -30 exact"; # backward
        TAB = "script-binding skip-to-silence";

        F = "script-binding quality_menu/video_formats_toggle"; # ! Stream Quality > Video
        "Alt+f" = "script-binding quality_menu/audio_formats_toggle"; # ! Stream Quality > Audio
      };

      config = {
        profile = "gpu-hq";
        hwdec = "auto";
        gpu-api = "vulkan";
        fbo-format = "rgba16hf";
        vo = "gpu";
        script-opts = "ytdl_hook-ytdl_path=${pkgs.yt-dlp}/bin/yt-dlp";

        scale = "ewa_lanczossharp";
        dscale = "mitchell";
        linear-downscaling = "no";
        correct-downscaling = "yes";
        cscale = "mitchell";
        sigmoid-upscaling = "no";
        linear-upscaling = "no";
        scale-antiring = 0.7;
        dscale-antiring = 0.7;
        cscale-antiring = 0.7;
        deband = "yes";
        deband-iterations = 4;
        deband-threshold = 35;
        deband-range = 16;
        deband-grain = 4;

        # Screenshot
        screenshot-format = "png";
        screenshot-high-bit-depth = "yes";
        screenshot-png-compression = "7"; # if it takes too long taking screenshots then delete this line
        screenshot-directory = "~/Imagens/";

        # misc
        volume-max = 300;
        geometry = "100%x100%-+0-+0";
        window-maximized = "yes";
        keep-open = "yes";
        keepaspect-window = "no";
        save-position-on-quit = "yes";
        osd-bar = "no";
        border = "no";
        osc = "no";

        # subtitles
        slang = "por,eng";
        sub-ass-override = "force";
        sub-ass-style-overrides = "ScaledBorderAndShadow=yes";
        sub-border-color = "#000000";
        sub-border-size = 4;
        sub-color = "#FFFFFFFF";
        sub-font-size = 48;
        sub-font = "Trebuchet MS";
        sub-margin-y = 36;
        sub-shadow-color = "#000000";
        sub-shadow-offset = 2;
        script-opts-append = "osc-visibility=never";
      };

      scripts = with pkgs.mpvScripts; [
        uosc
        autoload
        (quality-menu.override { oscSupport = true; })
        thumbfast
      ];

      scriptOpts = {

        quality-menu = {

          up_binding = "UP WHEEL_UP";
          down_binding = "DOWN WHEEL_DOWN";
          select_binding = "ENTER MBTN_LEFT";
          close_menu_binding = "ESC MBTN_RIGHT";

          ytdl_ver = "yt-dlp";

          selected_and_active = "▶  -";
          selected_and_inactive = "●  -";
          unselected_and_active = "▷ - ";
          unselected_and_inactive = "○ - ";

          scale_playlist_by_window = "yes";

          style_ass_tags = "{\\fnmonospace\\fs25\\bord1}";

          shift_x = 0;
          shift_y = 0;

          text_padding_x = 5;
          text_padding_y = 10;

          curtain_opacity = 0.7;

          menu_timeout = 6;

          fetch_formats = "yes";

          quality_strings_video = ''[ {"4320p" : "bestvideo[height<=?4320p]"}, {"2160p" : "bestvideo[height<=?2160]"}, {"1440p" : "bestvideo[height<=?1440]"}, {"1080p" : "bestvideo[height<=?1080]"}, {"720p" : "bestvideo[height<=?720]"}, {"480p" : "bestvideo[height<=?480]"}, {"360p" : "bestvideo[height<=?360]"}, {"240p" : "bestvideo[height<=?240]"}, {"144p" : "bestvideo[height<=?144]"} ]'';
          quality_strings_audio = ''[ {"default" : "bestaudio"} ]'';

          fetch_on_start = "yes";

          start_with_menu = "no";

          include_unknown = "no";

          hide_identical_columns = "yes";

          columns_video = "-resolution,frame_rate,dynamic_range|language,bitrate_total,size,-codec_video,-codec_audio";
          columns_audio = "audio_sample_rate,bitrate_total|size,language,-codec_audio";

          sort_video = "height,fps,tbr,size,format_id";
          sort_audio = "asr,tbr,size,format_id";

        };

        uosc = {
          controls = "menu,gap,subtitles,<has_many_audio>audio,<has_many_video>video,<has_many_edition>editions,<stream>stream-quality,gap,space,speed,space,shuffle,loop-playlist,loop-file,gap,prev,items,next,gap,fullscreen";
          controls_size = 32;
          controls_margin = 8;
          controls_spacing = 2;
          controls_persistency = "";

          volume = "right";
          volume_size = 40;
          volume_border = 1;
          volume_step = 1;
          volume_persistency = "";

          # Playback speed widget: mouse drag or wheel to change, click to reset
          speed_step = 0.1;
          speed_step_is_factor = "no";
          speed_persistency = "";

          # Controls all menus, such as context menu, subtitle loader/selector, etc
          menu_item_height = 36;
          menu_min_width = 260;
          menu_padding = 4;
          # Determines if `/` or `ctrl+f` is required to activate the search, or if typing
          # any text is sufficient.
          # When enabled, you can no longer toggle a menu off with the same key that opened it, if the key is a unicode character.
          menu_type_to_search = "yes";

          # Top bar with window controls and media title
          # Can be: never, no-border, always
          top_bar = "no-border";
          top_bar_size = 40;
          top_bar_controls = "yes";
          # Can be: `no` (hide), `yes` (inherit title from mpv.conf), or a custom template string
          top_bar_title = "yes";
          # Template string to enable alternative top bar title. If alt title matches main title,
          # it'll be hidden. Tip: use `${media-title}` for main, and `${filename}` for alt title.
          top_bar_alt_title = "";
          # Can be:
          #   `below`  => display alt title below the main one
          #   `toggle` => toggle the top bar title text between main and alt by clicking
          #               the top bar, or calling `toggle-title` binding
          top_bar_alt_title_place = "below";
          # Flash top bar when any of these file types is loaded. Available: audio,image,video
          top_bar_flash_on = "video,audio";
          top_bar_persistency = "";

          # Window border drawn in no-border mode
          window_border_size = 1;

          # If there's no playlist and file ends, load next file in the directory
          # Requires `keep-open=yes` in `mpv.conf`.
          autoload = "no";
          # What types to accept as next item when autoloading or requesting to play next file
          # Can be: video, audio, image, subtitle
          autoload_types = "video,audio,image";
          # Enable uosc's playlist/directory shuffle mode
          # This simply makes the next selected playlist or directory item be random, just
          # like any other player in the world. It also has an easily togglable control button.
          shuffle = "no";

          # Scale the interface by this factor
          scale = 1;
          # Scale in fullscreen
          scale_fullscreen = 1.3;
          # Adjust the text scaling to fit your font
          font_scale = 1;
          # Border of text and icons when drawn directly on top of video
          text_border = 1.2;
          # Border radius of buttons, menus, and all other rectangles
          border_radius = 4;
          # A comma delimited list of color overrides in RGB HEX format. Defaults:
          # foreground=ffffff,foreground_text=000000,background=000000,background_text=ffffff,curtain=111111,success=a5e075,error=ff616e
          color = "";
          # A comma delimited list of opacity overrides for various UI element backgrounds and shapes.
          # This does not affect any text, which is always rendered fully opaque. Defaults:
          # timeline=0.9,position=1,chapters=0.8,slider=0.9,slider_gauge=1,controls=0,speed=0.6,menu=1,submenu=0.4,border=1,title=1,tooltip=1,thumbnail=1,curtain=0.8,idle_indicator=0.8,audio_indicator=0.5,buffering_indicator=0.3,playlist_position=0.8
          opacity = "";
          # A comma delimited list of features to refine at a cost of some performance impact.
          # text_width - Use a more accurate text width measurement that measures each text string individually
          #              instead of just measuring the width of known letters once and adding them up.
          # sorting    - Use filename sorting that handles non-english languages better, especially asian ones.
          #              At the moment, this is only available on windows, and has no effect on other platforms.
          refine = "";
          # Duration of animations in milliseconds
          animation_duration = 100;
          # Execute command for background clicks shorter than this number of milliseconds, 0 to disable
          # Execution always waits for `input-doubleclick-time` to filter out double-clicks
          click_threshold = 0;
          click_command = "cycle pause; script-binding uosc/flash-pause-indicator";
          # Flash duration in milliseconds used by `flash-{element}` commands
          flash_duration = 1000;
          # Distances in pixels below which elements are fully faded in/out
          proximity_in = 40;
          proximity_out = 120;
          # Use only bold font weight throughout the whole UI
          font_bold = "no";
          # One of `total`, `playtime-remaining` (scaled by the current speed), `time-remaining` (remaining length of file)
          destination_time = "playtime-remaining";
          # Display sub second fraction in timestamps up to this precision
          time_precision = 0;
          # Display stream's buffered time in timeline if it's lower than this amount of seconds, 0 to disable
          buffered_time_threshold = 60;
          # Hide UI when mpv autohides the cursor. Timing is controlled by `cursor-autohide` in `mpv.conf` (in milliseconds).
          autohide = "no";
          # Can be: flash, static, manual (controlled by flash-pause-indicator and decide-pause-indicator commands)
          pause_indicator = "flash";
          # Sizes to list in stream quality menu
          stream_quality_options = "
            4320,
            2160,
            1440,
            1080,
            720,
            480,
            360,
            240,
            144,
          ";
          # Types to identify media files
          video_types = "3g2,3gp,asf,avi,f4v,flv,h264,h265,m2ts,m4v,mkv,mov,mp4,mp4v,mpeg,mpg,ogm,ogv,rm,rmvb,ts,vob,webm,wmv,y4m";
          audio_types = "aac,ac3,aiff,ape,au,cue,dsf,dts,flac,m4a,mid,midi,mka,mp3,mp4a,oga,ogg,opus,spx,tak,tta,wav,weba,wma,wv";
          image_types = "apng,avif,bmp,gif,j2k,jp2,jfif,jpeg,jpg,jxl,mj2,png,svg,tga,tif,tiff,webp";
          subtitle_types = "aqt,ass,gsub,idx,jss,lrc,mks,pgs,pjs,psb,rt,sbv,slt,smi,sub,sup,srt,ssa,ssf,ttxt,txt,usf,vt,vtt";
          # Default open-file menu directory
          default_directory = "~/";
          # List hidden files when reading directories. Due to environment limitations, this currently only hides
          # files starting with a dot. Doesn't hide hidden files on windows (we have no way to tell they're hidden).
          show_hidden_files = "no";
          # Move files to trash (recycle bin) when deleting files. Dependencies:
          # - Linux: `sudo apt install trash-cli`
          # - MacOS: `brew install trash`
          use_trash = "no";
          # Adjusted osd margins based on the visibility of UI elements
          adjust_osd_margins = "yes";

          # Adds chapter range indicators to some common chapter types.
          # Additionally to displaying the start of the chapter as a diamond icon on top of the timeline,
          # the portion of the timeline of that chapter range is also colored based on the config below.
          #
          # The syntax is a comma-delimited list of `{type}:{color}` pairs, where:
          # `{type}` => range type. Currently supported ones are:
          #   - `openings`, `endings` => anime openings/endings
          #   - `intros`, `outros` => video intros/outros
          #   - `ads` => segments created by sponsor-block software like https://github.com/po5/mpv_sponsorblock
          # `{color}` => an RGB(A) HEX color code (`rrggbb`, or `rrggbbaa`)
          #
          # To exclude marking any of the range types, simply remove them from the list.
          chapter_ranges = "openings:30abf964,endings:30abf964,ads:c54e4e80";
          # Add alternative lua patterns to identify beginnings of simple chapter ranges (except for `ads`)
          # Syntax: `{type}:{pattern}[,{patternN}][;{type}:{pattern}[,{patternN}]]`
          chapter_range_patterns = "openings:オープニング;endings:エンディング";

          # Localization language priority from highest to lowest.
          # Also controls what languages are fetched by `download-subtitles` menu.
          # Built in languages can be found in `uosc/intl`.
          # `slang` is a keyword to inherit values from `--slang` mpv config.
          # Supports paths to custom json files: `languages=~~/custom.json,slang,en`
          languages = "slang,en";

          # A comma separated list of element IDs to disable. Available IDs:
          #   window_border, top_bar, timeline, controls, volume,
          #   idle_indicator, audio_indicator, buffering_indicator, pause_indicator
          disable_elements = "";
        };
      };
    };
  };
}
