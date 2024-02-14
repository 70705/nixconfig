{ config, pkgs, pkgs-unstable, ... }:

{
  
  imports = [ 
    ./xfce-home/xfce-home.nix
    ./misc/desktop-entries.nix
  ];

  home.username = "victor";
  home.homeDirectory = "/home/victor";
   
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    
    spotify
    vesktop
    steam
    gamemode
    mpv    

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
    #jq # A lightweight and flexible command-line JSON processor
    #yq-go # yaml processer https://github.com/mikefarah/yq’
    fzf # A command-line fuzzy finder
    

    # password thingies
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
    neofetch
    
    # fonts
    noto-fonts-cjk-sans

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
    htop
  ];

  programs.chromium = {
    enable = true;
    package = pkgs-unstable.vivaldi;
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
