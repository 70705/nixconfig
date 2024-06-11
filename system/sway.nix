{ 
  pkgs,
  ... 
}:

{
#   services.displayManager.sddm = {
#    enable = true;
#    wayland.enable = true;
#    autoNumlock = true;
#   };

  services.displayManager.enable = false;
  programs.sway = {
    enable = true;
    package = pkgs.swayfx;
    wrapperFeatures.gtk = true;
    extraSessionCommands = ''
        export GBM_BACKEND=nvidia-drm
        export LIBVA_DRIVER_NAME=nvidia
        export XDG_SESSION_TYPE=wayland
        export XWAYLAND_NO_GLAMOR=1    
        export __GLX_VENDOR_LIBRARY_NAME=nvidia
        export ELECTRON_OZONE_PLATFORM_HINT=auto
        export WLR_NO_HARDWARE_CURSORS=1
        # SDL:
        export SDL_VIDEODRIVER=wayland
        # QT (needs qt5.qtwayland in systemPackages):
        export QT_QPA_PLATFORM=wayland-egl
        export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
        # Fix for some Java AWT applications (e.g. Android Studio),
        # use this if they aren't displayed properly:
        export _JAVA_AWT_WM_NONREPARENTING=1'';
  };

  services = {
    gvfs.enable = true;
#    tumbler.enable = lib.mkForce false;
    gnome.gnome-keyring.enable = true;
#    displayManager.defaultSession = "xfce+i3";
#    displayManager.autoLogin.user = "victor";
#    displayManager.autoLogin.enable = true;
  };
}
