{ 
  pkgs,
  lib ? pkgs.lib,
}:

{
  hyprwall = pkgs.callPackage ./pkgs/hyprwall {};
  hyprland = pkgs.callPackage ./pkgs/hyprland {};
  phinger-hyprcursor = pkgs.callPackage ./pkgs/phinger-hyprcursor {};
  swww = pkgs.callPackage ./pkgs/swww {};
  ptouch-driver = pkgs.callPackage ./pkgs/ptouch-driver {};
  flameshot = pkgs.callPackage ./pkgs/flameshot { enableWlrSupport = true; };
  waybar = pkgs.callPackage ./pkgs/waybar {};
  hyprland-autoname-workspaces = pkgs.callPackage ./pkgs/hyprland-autoname-workspaces {};
}
