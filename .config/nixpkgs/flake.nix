{
  description = "Linux Desktop Home Manager configuration of Edoardo Debenedetti";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixgl.url = "github:guibou/nixGL";
  };

  outputs = { self, nixgl, nixpkgs, home-manager }:

  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  
  {
    homeConfigurations = {
      "edoardo@pop-os" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home/pop-os.nix
        ];
      };
    };
  };
}
