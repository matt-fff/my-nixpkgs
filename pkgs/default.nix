{ pkgs ? import <nixpkgs> {}, lib ? pkgs.lib }:

{
  blurlock = pkgs.callPackage ./blurlock {};
  i3exit = pkgs.callPackage ./i3exit {};
  cursor-server = pkgs.callPackage ./cursor-server {};
}
