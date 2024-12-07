{ 
  pkgs,
  lib ? pkgs.lib,
  unstable }:

{
  blurlock = pkgs.callPackage ./blurlock {};
  i3exit = pkgs.callPackage ./i3exit {};
  cursor-server = pkgs.callPackage ./cursor-server {};
  hyprwall = pkgs.callPackage ./hyprwall {};
  hyprland = pkgs.callPackage ./hyprland {};
  phinger-hyprcursor = pkgs.callPackage ./phinger-hyprcursor {};
  balena-etcher = pkgs.callPackage ./balena-etcher {};
  swww = unstable.callPackage ./swww {};
  ptouch-driver = pkgs.callPackage ./ptouch-driver {};
  flameshot = pkgs.callPackage ./flameshot { enableWlrSupport = true; };
  waybar = unstable.callPackage ./waybar {};
  hyprland-autoname-workspaces = unstable.callPackage ./hyprland-autoname-workspaces {};
}
