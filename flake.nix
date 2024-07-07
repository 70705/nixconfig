{
  description = "victor's Flake";


  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    #nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixvim-config.url = "github:70705/nixvim-config";
    audiorelay.url = "github:70705/audiorelay-flake-fork";

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
      url = "github:A1ca7raz/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  }; 
 
   outputs = { self, nixpkgs, home-manager, ... }@inputs: let
       system = "x86_64-linux";
        specialArgs = {
#        pkgs-unstable = import nixpkgs-unstable {
#          inherit system;
#          config.allowUnfree = true;
#        };
       
        inherit system;
        inherit inputs;
      };

      in {
      nixosConfigurations = {
        wired = nixpkgs.lib.nixosSystem { 
          inherit system;
          inherit specialArgs;

          modules = [
            ./configuration.nix
            home-manager.nixosModules.home-manager
            inputs.stylix.nixosModules.stylix
            inputs.nix-gaming.nixosModules.platformOptimizations
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.victor = import ./home.nix;
              extraSpecialArgs = specialArgs;
            };
          }
        ];
      };
    };
  };
}
