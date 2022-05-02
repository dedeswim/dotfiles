{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    git
    gh
    pre-commit
  ];

  programs.git = {
    enable = true;
    userName  = "Edoardo Debenedetti";
    userEmail = "edoardo.m.debenedetti@gmail.com";
    extraConfig = {
      pull.rebase = false;
    };
  };

}