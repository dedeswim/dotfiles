{ config, pkgs, ... }:

let
  nixgl = import <nixgl> {};
in

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "edoardo";
  home.homeDirectory = "/home/edoardo";
  home.sessionVariables = {
    EDITOR = "hx";
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
    # OS Basics
    alacritty
    bat
    exa
    fd
    gh
    htop
    nixgl.auto.nixGLDefault
    ripgrep
    starship
    tealdeer
    tmux
    topgrade
    zsh
    # Daily programs
    tdesktop
    # Dev tools
    vscode
    google-cloud-sdk
    helix
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
    bat = {
      enable = true;
      config = {
        theme = "TwoDark";
      };
    };
    git = {
      enable = true;
      userName  = "Edoardo Debenedetti";
      userEmail = "edoardo.m.debenedetti@gmail.com";
      extraConfig = {
        pull.rebase = false;
      };
    };
    zsh = {
      enable = true;
      enableAutosuggestions = true;
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
        "files.autoSave" = "onFocusChange";
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
          normal = {
            family = "CaskaydiaCove Nerd Font";
            style = "Light";
          };
          bold = {
            family = "CaskaydiaCove Nerd Font";
            style = "Medium";
          };
          italic = {
            family = "CaskaydiaCove Nerd Font";
            style = "Light Italic";
          };
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
