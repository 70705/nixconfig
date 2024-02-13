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
  home.file.".config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml" = {
    source = ./xfce-home/xfce4-panel.xml;
    force = true;
    };

  home.file.".themes" = {
    source = ./xfce-home/themes;
#    recursive = true;
#    executable = true;
   };

  home.file.".icons" = {
    source = ./xfce-home/icons;
#    recursive = true;
    executable = true;
   };

#  home.file.".fonts" = {
#    source = ./xfce-home/fonts;
#    recursive = true;
#    executable = true;
#   };



  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';


  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # here is some command line tools I use frequently
    # feel free to add your own or remove some of them

    neofetch
   # vivaldi
    spotify
    vesktop
    steam
    #audio-relay.packages.${pkgs.system}.audio-relay
    
    htop
    xorg.fontcronyxcyrillic

    pavucontrol
    
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

    # misc
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
  ];
  programs.chromium = {
    enable = true;
    package = pkgs.vivaldi;
    commandLineArgs = [ "--enable-blink-features=MiddleClickAutoscroll" "--enable-features=VaapiVideoEncoder,VaapiVideoDecoder,CanvasOopRasterization,WebUIDarkMode" "--force-dark-mode" "--start-maximized" ];
  };
  # basic configuration of git, please change to your own
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

  #programs.audio-relay.enable = true;
  
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
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
