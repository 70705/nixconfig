{
  description = "victor's Flake";

  outputs =
    {
      self,
      nixpkgs,
      nur,
      home-manager,
      ...
    }@inputs:
    let
      definedVars = {
        username = "victor";
        hostname = "wired";
        timezone = "America/Recife";
        locale = "pt_BR.UTF-8";

        extraLocale = [
          "en_US.UTF-8/UTF-8"
          "pt_BR.UTF-8/UTF-8"
          "C.UTF-8/UTF-8"
          "ja_JP.UTF-8/UTF-8"
        ];
        system = "x86_64-linux";
      };

    in
    {
      nixosConfigurations = {
        ${definedVars.hostname} = nixpkgs.lib.nixosSystem {
          system = definedVars.system;

          specialArgs = {
            inherit inputs;
            inherit definedVars;
          };

          modules = [
            ./hosts/${definedVars.hostname}/configuration.nix
            home-manager.nixosModules.home-manager
            inputs.stylix.nixosModules.stylix
            inputs.nix-index-database.nixosModules.nix-index
            inputs.nix-gaming.nixosModules.platformOptimizations

            { programs.nix-index-database.comma.enable = true; }
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.${definedVars.username} = import ./hosts/${definedVars.hostname}/home.nix;
                extraSpecialArgs = {
                  inherit inputs;
                  inherit definedVars;
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
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    nur.url = "github:nix-community/NUR";

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-alien = {
      url = "github:thiagokokada/nix-alien";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rhythia = {
      url = "github:70705/rhythia-flake";
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
