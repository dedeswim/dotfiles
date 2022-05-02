{
  description = "Linux Desktop Home Manager configuration of Edoardo Debenedetti";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixgl.url = "github:guibou/nixGL";
  };

  outputs = { self, nixgl, nixpkgs, home-manager }:

  let
    pkgs = import nixpkgs {
      overlays = [ nixgl.overlay ];
    };
  in
  
  {
    homeConfigurations = {
      xps = home-manager.lib.homeManagerConfiguration {
        # Specify the path to your home configuration here
        configuration = { pkgs, config, ... }:
        {
          xdg.configFile."nix/nix.conf".source = ./configs/nix.conf;
          nixpkgs.config = import ./config.nix;
          imports = [
            ./modules/cli.nix
            ./modules/desktop-programs.nix
            ./modules/gl-wrappers.nix
            ./modules/home-manager.nix
          ];
        };
        system = "x86_64-linux";
        username = "edoardo";
        homeDirectory = "/home/edoardo";
        stateVersion = "22.05";
      };
    };

    xps = self.homeConfigurations.xps.activationPackage;
  };
}
