{ 
  pkgs,
  lib ? pkgs.lib,
  unstable }:

{
  hyprwall = pkgs.callPackage ./hyprwall {};
  hyprland = pkgs.callPackage ./hyprland { pkgs = unstable; };
  phinger-hyprcursor = pkgs.callPackage ./phinger-hyprcursor { pkgs = unstable; };
  swww = unstable.callPackage ./swww {};
  ptouch-driver = pkgs.callPackage ./ptouch-driver {};
  flameshot = pkgs.callPackage ./flameshot { enableWlrSupport = true; };
  waybar = unstable.callPackage ./waybar {};
  hyprland-autoname-workspaces = unstable.callPackage ./hyprland-autoname-workspaces {};
}
