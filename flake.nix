{
  description = "victor's Flake";


  inputs = {
     nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
     home-manager = {
         url = "github:nix-community/home-manager/release-23.11";
         inputs.nixpkgs.follows = "nixpkgs";
     };
   }; 

   outputs = { self, nixpkgs, home-manager, ... }@inputs: let 
       inherit (self) outputs;
      in {
      nixosConfigurations = {
        wired = nixpkgs.lib.nixosSystem { 
         system = "x86_64-linux";

          specialArgs = {inherit inputs outputs;};
        #  specialArgs = inputs;
          modules = [
               ./configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            # TODO replace ryan with your own username
#            home-manager.backupFileExtension = "bak";
            home-manager.users.victor = import ./home.nix;
            home-manager.extraSpecialArgs = {inherit inputs outputs;};
          }
        ];
      };
    };
  };
}
