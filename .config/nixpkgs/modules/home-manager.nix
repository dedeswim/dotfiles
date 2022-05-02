{ config, pkgs, libs, ... }:
{
  home.stateVersion = "22.05";
  home.sessionVariables = {
    EDITOR = "hx";
    BROWSER = "firefox";
    TERMINAL = "gnome-terminal";
  };
  programs.home-manager.enable = true;
}