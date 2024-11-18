{ 
  pkgs ? import <nixpkgs> {}, 
  lib ? pkgs.lib,
  unstable ? import <nix-unstable> {} }:

{
  blurlock = pkgs.callPackage ./blurlock {};
  i3exit = pkgs.callPackage ./i3exit {};
  cursor-server = pkgs.callPackage ./cursor-server {};
  hyprwall = pkgs.callPackage ./hyprwall {};
  hyprland = pkgs.callPackage ./hyprland {};
  phinger-hyprcursor = pkgs.callPackage ./phinger-hyprcursor {};
  swww = unstable.callPackage ./swww {};
}
