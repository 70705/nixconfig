{ config, pkgs, ... }:

{
  
  imports = [ 
    ./xfce-home/xfce-home.nix
  ];

  home.username = "victor";
  home.homeDirectory = "/home/victor";

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };
#  home.file.".config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml" = {
#     source = ./xfce-home/xfce4-panel.xml;
#     force = true;
#    };

  home.file.".themes" = {
    source = ./xfce-home/themes;
   };

  home.file.".icons" = {
    source = ./xfce-home/icons;
   };

  home.file.".local/share/fonts" = {
    source = ./xfce-home/fonts;
   };



  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';
   
  fonts.fontconfig.enable = true;

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # here is some command line tools I use frequently
    # feel free to add your own or remove some of them

    neofetch
    spotify
    vesktop
    steam
    htop
    gamemode
    
    # Audio related
    easyeffects
    pavucontrol
    alsa-utils

    # archives
    zip
    xz
    unzip
    xarchiver

    # utils
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    yq-go # yaml processer https://github.com/mikefarah/yq
    eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder
    
    keeweb
    libsecret
    gnome.gnome-keyring


    # misc
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg
    noto-fonts-cjk-sans

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
  ];

  xdg.desktopEntries.keeweb = {
    name="KeeWeb";
    genericName="Password Manager";
    exec= "keeweb --no-sandbox %u";
    icon="keeweb";
    terminal=false;
    type="Application";
    categories= [ "Utility" ];
    mimeType=[ "application/x-keepass2" ];
  };

  programs.chromium = {
    enable = true;
    package = pkgs.vivaldi;
    commandLineArgs = [ "--enable-blink-features=MiddleClickAutoscroll" "--enable-features=VaapiVideoEncoder,VaapiVideoDecoder,CanvasOopRasterization,WebUIDarkMode" "--force-dark-mode" "--start-maximized" ];
  };


  programs.git = {
    enable = true;
    userName = "70705";
    userEmail = "totos@riseup.net";
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    # TODO add your cusotm bashrc here
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';

    # set some aliases, feel free to add more or remove some
    shellAliases = {
      k = "kubectl";
      urldecode = "python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.stdin.read()))'";
      urlencode = "python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'";
    };
  };

  services.picom = {
    enable = true;
    shadow = false;
    vSync = true;
    backend = "glx";
  };

  services.kdeconnect.enable = true;
  
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      keeweb = "keeweb --no-sandbox";
     };
    oh-my-zsh.enable = true;
    oh-my-zsh.theme = "Chicago95";
    oh-my-zsh.custom = "/etc/nixos/xfce-home/ohmyzsh";
  };
  
  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
