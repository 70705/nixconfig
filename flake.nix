{
  description = "victor's Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixvim-config.url = "github:70705/nixvim-config";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    nur.url = "github:nix-community/NUR";

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

  outputs = { self, nixpkgs, nur, home-manager, ... }@inputs: let
    system = "x86_64-linux";
    specialArgs = {
      inherit system;
      inherit inputs;
    };

  in {
    nixosConfigurations = {
      wired = nixpkgs.lib.nixosSystem { 
        inherit system;
        inherit specialArgs;

        modules = [
          ./hosts/wired/configuration.nix
          
          home-manager.nixosModules.home-manager
          
          #({ config, pkgs, ... }: {
            #nixpkgs.overlays = [ nur.overlay ];
          
          #})
          
          inputs.stylix.nixosModules.stylix
          
          inputs.nix-gaming.nixosModules.platformOptimizations
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.victor = import ./hosts/wired/home.nix;
              extraSpecialArgs = specialArgs;
            };
          }
        ];
      };
    };
  };
}
