{ config, pkgs, libs, ... }:

let
  nixgl = import <nixgl> {};
in

{
  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "CascadiaCode" ]; })
    google-chrome
    flameshot
    # tdesktop
    vscode
    nixgl.auto.nixGLDefault
  ];

  xdg = {
    enable = true;
    mime.enable = true;
  };

  fonts.fontconfig.enable = true;

  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    extensions = with pkgs.vscode-extensions; [
      pkief.material-icon-theme
      zhuangtongfa.material-theme
      ms-vscode-remote.remote-ssh
      jnoortheen.nix-ide
      eamodio.gitlens
      github.copilot
    ];
    userSettings = {
      "editor.fontSize" = 18;
      "editor.fontFamily" = "'CaskaydiaCove Nerd Font', 'monospace', monospace";
      "workbench.preferredDarkColorTheme" = "One Dark Pro";
      "workbench.colorTheme" = "One Dark Pro";
      "workbench.iconTheme" = "material-icon-theme";
      "window.titleBarStyle" = "custom";
      "editor.fontLigatures" = true;
      "files.autoSave" = "onFocusChange";
      "editor.inlineSuggest.enabled" = true;
      "git.autofetch" = true;
      "git.confirmSync" = false;
    };
  };
}