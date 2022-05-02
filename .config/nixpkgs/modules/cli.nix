{ config, pkgs, libs, ... }:

{
  home.packages = with pkgs; [
    bat
    bitwarden-cli
    curl
    exa
    fd
    git
    google-cloud-sdk
    helix
    nix-zsh-completions
    nmap
    ripgrep
    starship
    tealdeer
    tmux
    topgrade
    tree
    unzip
    zsh
  ];

  programs.bat = {
    enable = true;
    config = {
      theme = "TwoDark";
    };
  };

  programs.git = {
      enable = true;
      userName  = "Edoardo Debenedetti";
      userEmail = "edoardo.m.debenedetti@gmail.com";
      extraConfig = {
        pull.rebase = false;
      };
  };

  programs.helix = {
    enable = true;
    settings = {
      theme = "onedark";
    };
  };

  programs.starship = {
    enable = true;
    settings = {
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
      };
    };
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    initExtraFirst = ''
      eval "$(starship init zsh)"
    '';
    shellAliases = {
      rm = "rm -i";
      cp = "cp -i";
      mv = "mv -i";
      python = "ptython3";
    };
    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-syntax-highlighting"; }
        { name = "DarrinTisdale/zsh-aliases-exa"; }
      ];
    };
  };
}