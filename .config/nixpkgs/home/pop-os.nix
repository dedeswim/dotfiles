{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    username = "edoardo";
    homeDirectory = "/home/edoardo";
    stateVersion = "22.05";
  };


  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.

  xdg.configFile."nix/nix.conf".source = ../configs/nix.conf;
  nixpkgs.config = import ../config.nix;
  programs.zsh.initExtra = builtins.readFile ../configs/zsh/linux-desktop.zsh;

  imports = [
    ../modules/cli.nix
    ../modules/desktop-programs.nix
    ../modules/gl-wrappers.nix
    ../modules/home-manager.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
