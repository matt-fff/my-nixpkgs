{ pkgs ? import <nixpkgs> {}, lib ? pkgs.lib }:

{
  blurlock = pkgs.callPackage ./blurlock {};
  i3exit = pkgs.callPackage ./i3exit {};
  cursor-server = pkgs.callPackage ./cursor-server {};
  hyprwall = pkgs.callPackage ./hyprwall {};
  hyprland = pkgs.callPackage ./hyprland {};
  phinger-hyprcursor = pkgs.callPackage ./phinger-hyprcursor {};
}
