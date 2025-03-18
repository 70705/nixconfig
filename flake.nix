{
  description = "victor's Flake";

  outputs = {
    self,
    nixpkgs,
    nur,
    home-manager,
    flatpaks,
    lix-module,
    chaotic,
    ...
  } @ inputs: let
    sysVar = {
      username = "victor";
      hostname = "nijika";
      shell = "zsh"; # OPTIONS: zsh, fish
      timezone = "America/Recife";
      gpu = "nvidia";

      kernel = "linuxPackages_cachyos"; # OPTIONS: xanmod, xanmod_latest, lqx, zen, latest
      system = "x86_64-linux";

      networkInterface = "enp3s0f0";

      locale = "pt_BR.UTF-8";
      extraLocale = [
        "en_US.UTF-8/UTF-8"
        "pt_BR.UTF-8/UTF-8"
        "C.UTF-8/UTF-8"
        "ja_JP.UTF-8/UTF-8"
      ];
    };
  in {
    nixosConfigurations = {
      ${sysVar.hostname} = nixpkgs.lib.nixosSystem {
        system = sysVar.system;

        specialArgs = {
          inherit inputs;
          inherit sysVar;
        };

        modules = [
          ./hosts/${sysVar.hostname}/system.nix
          home-manager.nixosModules.home-manager
          inputs.stylix.nixosModules.stylix
          inputs.nix-index-database.nixosModules.nix-index
          inputs.nix-gaming.nixosModules.platformOptimizations
          flatpaks.nixosModules.declarative-flatpak
          lix-module.nixosModules.default
          chaotic.nixosModules.default

          {programs.nix-index-database.comma.enable = true;}
          {
            home-manager = {
              useGlobalPkgs = true;
              sharedModules = [inputs.nixcord.homeManagerModules.nixcord];
              useUserPackages = true;
              users.${sysVar.username} = import ./hosts/${sysVar.hostname}/home.nix;
              extraSpecialArgs = {
                inherit inputs;
                inherit sysVar;
              };
            };
          }
        ];
      };
    };
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixvim-config.url = "github:70705/nixvim-config";
    hyprland.url = "github:hyprwm/Hyprland";
    nur.url = "github:nix-community/NUR";
    flatpaks.url = "github:GermanBread/declarative-flatpak/stable-v3";
    nixcord.url = "github:kaylorben/nixcord";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.92.0.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-alien = {
      url = "github:thiagokokada/nix-alien";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-gaming = {
      url = "github:fufexan/nix-gaming";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
