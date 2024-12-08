{ 
  pkgs,
  lib ? pkgs.lib,
  unstable }:

{
  hyprwall = pkgs.callPackage ./pkgs/hyprwall {};
  hyprland = pkgs.callPackage ./pkgs/hyprland { pkgs = unstable; };
  phinger-hyprcursor = pkgs.callPackage ./pkgs/phinger-hyprcursor { pkgs = unstable; };
  swww = unstable.callPackage ./pkgs/swww {};
  ptouch-driver = pkgs.callPackage ./pkgs/ptouch-driver {};
  flameshot = pkgs.callPackage ./pkgs/flameshot { enableWlrSupport = true; };
  waybar = unstable.callPackage ./pkgs/waybar {};
  hyprland-autoname-workspaces = unstable.callPackage ./pkgs/hyprland-autoname-workspaces {};
}
