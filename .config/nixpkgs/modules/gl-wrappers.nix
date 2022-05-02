{ config, pkgs, ... }:
let nixGLIntel = (pkgs.callPackage "${builtins.fetchTarball {
      url = https://github.com/guibou/nixGL/archive/56f2fbcce7a08c60c98394a64e900d5e9227bcb2.tar.gz;
      # sha256 = "0yh8zq746djazjvlspgyy1hvppaynbqrdqpgk447iygkpkp3f5qr";
    }}/nixGL.nix"
  { }).nixGLIntel;
in
{
  programs.alacritty = {
    enable = true;
    package =
      pkgs.writeShellScriptBin "alacritty" ''
        #!/bin/sh
        ${nixGLIntel}/bin/nixGLIntel ${pkgs.alacritty}/bin/alacritty "$@"
      '';
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
}