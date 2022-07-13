{ config, pkgs, libs, ... }:

{
  home.packages = with pkgs; [
    bat
    bitwarden-cli
    curl
    exa
    fd
    git
    gh
    google-cloud-sdk
    helix
    nix-zsh-completions
    nmap
    ripgrep
    starship
    tealdeer
    thefuck
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
        init.defaultBranch = "main";
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

  programs.topgrade = {
    enable = true;
    settings = {
      disable = [
        "gcloud"
        "home_manager"
      ];
      commands = {
        "Home Manager" = "nix flake update ~/.config/nixpkgs/ && home-manager switch --flake ~/.config/nixpkgs#edoardo@pop-os --impure";
      };
    };
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    shellAliases = {
      rm = "rm -i";
      cp = "cp -i";
      mv = "mv -i";
      python = "python3";
    };
    zplug = {
      enable = true;
      plugins = [
        { name = "DarrinTisdale/zsh-aliases-exa"; }
      ];
    };
    envExtra = ''
    eval $(thefuck --alias belin)
    '';
  };
}