{
  description = "victor's Flake";


  inputs = {
     nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
     nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
     spicetify-nix.url = "github:A1ca7raz/spicetify-nix";
     audiorelay.url = "github:70705/audiorelay-flake-fork";
     home-manager = {
         url = "github:nix-community/home-manager/release-23.11";
#         inputs.nixpkgs.follows = "nixpkgs";
     };
   }; 
 
   outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, spicetify-nix, audiorelay, ... }@inputs: let
       system = "x86_64-linux";
        specialArgs = {
        pkgs-unstable = import nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };
       
        inherit audiorelay;
        inherit spicetify-nix;
        inherit system;
        inherit inputs;
      };

      in {
      nixosConfigurations = {
        wired = nixpkgs.lib.nixosSystem { 
          inherit system;
          inherit specialArgs;

 
#          specialArgs = {inherit inputs outputs;};
          modules = [
               ./configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.victor = import ./home.nix;
            home-manager.extraSpecialArgs = specialArgs;
          }
        ];
      };
    };
  };
}
