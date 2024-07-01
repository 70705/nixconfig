{
  description = "victor's Flake";


  inputs = {
     nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
     nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
     nix-alien.url = "github:thiagokokada/nix-alien";
     rhythia.url = "github:70705/rhythia-flake";
     stylix.url = "github:danth/stylix";
#     niri.url = "github:sodiboo/niri-flake";

     nix-gaming.url = "github:fufexan/nix-gaming";
     nixvim-config.url = "github:70705/nixvim-config";
     spicetify-nix.url = "github:A1ca7raz/spicetify-nix";
     audiorelay.url = "github:70705/audiorelay-flake-fork";
#     chaotic = {
#       url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
#       inputs.nixpkgs.follows = "nixpkgs-unstable";
#       inputs.jovian.follows = "jovian-chaotic";
#     };

     home-manager = {
         url = "github:nix-community/home-manager/release-24.05";
         inputs.nixpkgs.follows = "nixpkgs";
     };
   }; 
 
   outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs: let
       system = "x86_64-linux";
        specialArgs = {
        pkgs-unstable = import nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };
       
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
#            inputs.niri.nixosModules.niri
#            chaotic.nixosModules.default
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
