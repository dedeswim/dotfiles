{ config, pkgs, libs, ... }:

{
  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "CascadiaCode" ]; })
    # nixgl.auto.nixGLDefault
    tdesktop
    vscode
  ];

  programs.vscode = {
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
}