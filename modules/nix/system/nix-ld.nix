{ 
  pkgs,
  options,
  lib,
  config,
  ... 
}:

let
  cfg = config.nixModules.nix-ld;
in
  {
    options.nixModules.nix-ld = {
      enable = lib.mkEnableOption "nix-ld";
  };

  config = lib.mkIf cfg.enable {
    programs.nix-ld.enable = true;
    programs.nix-ld.libraries = options.programs.nix-ld.libraries.default ++ (with pkgs; [ 
        stdenv.cc.cc
        openssl
        xorg.libXcomposite
        xorg.libXtst
        xorg.libXrandr
        xorg.libXext
        xorg.libX11
        xorg.libXfixes
        xorg.libxkbfile
        xorg.libxcb
        xcb-util-cursor
        xcbutilxrm
        xcb-imdkit
        xorg.xcbutil
        xorg.xcbproto
        xorg.xcbutilwm
        xorg.xcbutilimage
        xorg.xcbutilerrors
        xorg.xcbutilkeysyms
        xorg.xcbutilrenderutil
        nss_latest
        krb5
        libGL
        libva
        pipewire
        xorg.libxcb
        xorg.libXdamage
        xorg.libxshmfence
        xorg.libXxf86vm
        libelf
        libxkbcommon        
        libdrm
        cairo

        # Required
        zlib
        libz
        glib
        gtk2   
        bzip2
        mesa
        
        # Without these it silently fails
        xorg.libXinerama
        xorg.libXcursor
        xorg.libXrender
        xorg.libXScrnSaver
        xorg.libXi
        xorg.libSM
        xorg.libICE
        gnome2.GConf
        nspr
        nss
        cups
        libcap
        SDL2
        libusb1
        dbus-glib
        ffmpeg
        # Only libraries are needed from those two
        libudev0-shim
        
        # Verified games requirements
        xorg.libXt
        xorg.libXmu
        libogg
        libvorbis
        SDL
        SDL2_image
        glew110
        libidn
        tbb
        
        # Other things from runtime
        flac
        freeglut
        libjpeg
        libpng
        libpng12
        libsamplerate
        libmikmod
        libtheora
        libtiff
        pixman
        speex
        SDL_image
        SDL_ttf
        SDL_mixer
        SDL2_ttf
        SDL2_mixer
        libappindicator-gtk2
        libdbusmenu-gtk2
        libindicator-gtk2
        libcaca
        libcanberra
        libgcrypt
        libvpx
        librsvg
        xorg.libXft
        libvdpau
        gnome2.pango
        cairo
        atk
        gdk-pixbuf
        fontconfig
        freetype
        dbus
        alsaLib
        expat
   ]);
 };
}
