{
  description = "victor's Flake";


  inputs = {
     nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
     nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
     nix-alien.url = "github:thiagokokada/nix-alien";
     spicetify-nix.url = "github:A1ca7raz/spicetify-nix";
     audiorelay.url = "github:70705/audiorelay-flake-fork";
     nix-gaming.url = "github:fufexan/nix-gaming";
     nixvim-config.url = "github:70705/nixvim-config";
     chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
     home-manager = {
         url = "github:nix-community/home-manager/release-24.05";
#         inputs.nixpkgs.follows = "nixpkgs";
     };
   }; 
 
   outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, chaotic, ... }@inputs: let
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
            inputs.nix-gaming.nixosModules.platformOptimizations
            chaotic.nixosModules.default
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
