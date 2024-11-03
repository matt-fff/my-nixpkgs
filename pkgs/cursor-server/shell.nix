{ pkgs ? import <nixpkgs> {} }:

let
  cursor = pkgs.callPackage ./default.nix {};
in
pkgs.mkShell {
  buildInputs = [
    cursor
  ];

  shellHook = ''
    echo "Cursor development environment loaded"
  '';
} 