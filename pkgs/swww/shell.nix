let
  unstable = import <nixos-unstable> {};
in
unstable.callPackage ./default.nix {} 