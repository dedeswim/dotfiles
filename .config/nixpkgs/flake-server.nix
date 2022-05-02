{
  description = "Linux Desktop Home Manager configuration of Edoardo Debenedetti";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs
    home-manager.url = "github:nix-community/home-manager";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixgl.url = "github:guibou/nixGL";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, home-manager, nixpkgs, nixgl, ... }:
  
  let
      system = "x86_64-linux";
      username = "edoardo";
  in {
      home-manager.users.${username}.nixpkgs.config = import ./config.nix;
      homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
        # Specify the path to your home configuration here
        configuration = import ./home.nix;

        inherit system username;
        homeDirectory = "/home/${username}";
        stateVersion = "22.05";
      };
    };
}
