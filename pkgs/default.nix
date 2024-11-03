{ pkgs ? import <nixpkgs> {}, lib ? pkgs.lib }:

{
  cursor-bin = pkgs.callPackage ./cursor-bin {};
  blurlock = pkgs.callPackage ./blurlock {};
  i3exit = pkgs.callPackage ./i3exit {};
  cursor-server = pkgs.callPackage ./cursor-server {};
  desk = pkgs.callPackage ./desk {};
}
