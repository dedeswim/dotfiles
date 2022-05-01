{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "edoardo";
  home.homeDirectory = "/home/edoardo";
  home.sessionVariables = {
    EDITOR="code";
    BROWSER = "firefox";
    TERMINAL = "gnome-terminal";
  };

  xdg = {
    enable = true;
    mime.enable = true;
  };
  targets.genericLinux.enable = true;

  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    # Fonts
    (nerdfonts.override { fonts = [ "FiraCode" "CascadiaCode" ]; })
    # Basics
    bat
    exa
    gh
    htop
    starship
    tealdeer
    tmux
    topgrade
    zsh
    # Daily programs
    tdesktop
    # Dev tools
    vscode
    helix
    google-cloud-sdk
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  
  programs = {
    git = {
      enable = true;
      userName  = "Edoardo Debenedetti";
      userEmail = "edoardo.m.debenedetti@gmail.com";
    };
    zsh = {
      enable = true;
      enableAutosuggestions = true;
      shellAliases = {
        rm = "rm -i";
        cp = "cp -i";
        mv = "mv -i";
      };
      zplug = {
        enable = true;
        plugins = [
          { name = "zsh-users/zsh-syntax-highlighting"; }
          { name = "DarrinTisdale/zsh-aliases-exa"; }
        ];
      };
    };
    vscode = {
      enable = true;
      # package = pkgs.vscodium;    # You can skip this if you want to use the unfree version
      extensions = with pkgs.vscode-extensions; [
        pkief.material-icon-theme
        zhuangtongfa.material-theme
        ms-vscode-remote.remote-ssh
        jnoortheen.nix-ide
      ];
      userSettings = {
        "editor.fontSize" = 18;
        "editor.fontFamily" = "'CaskaydiaCove Nerd Font', 'monospace', monospace";
        "workbench.preferredDarkColorTheme" = "One Dark Pro";
        "workbench.colorTheme" = "One Dark Pro";
        "window.titleBarStyle" = "custom";
        "editor.fontLigatures" = true;
      };
    };
    helix = {
      enable = true;
      settings = {
        theme = "onedark";
      };
    };
    starship = {
      enable = true;
      settings = {
        character = {
          success_symbol = "[➜](bold green)";
          error_symbol = "[➜](bold red)";
        };
      };
    };
    alacritty = {
      enable = true;
      settings = {
        font = {
          size = 15;
        };
        # Colors (One Dark)
        colors = {
          primary = {
            background = "#282c34";
            foreground = "#abb2bf";
          };
          normal = {
            black = "#282c34";
            red = "#e06c75";
            green = "#98c379";
            yellow = "#d19a66";
            blue = "#61afef";
            magenta = "#c678dd";
            cyan = "#56b6c2";
            white = "#abb2bf";
          };
          bright = {
            black = "#5c6370";
            red = "#e06c75";
            green = "#98c379";
            yellow = "#d19a66";
            blue = "#61afef";
            magenta = "#c678dd";
            cyan = "#56b6c2";
            white = "#ffffff";
          };
        };
      };
    };
  };
}
