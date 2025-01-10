{
  description = "My custom package collection";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";
    unstablePkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, unstablePkgs }:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    in
    {
      packages = forAllSystems (system:
        let
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };
          unstable = import unstablePkgs {
            inherit system;
            config.allowUnfree = true;
          };
        in
        import ./default.nix {
          inherit pkgs unstable;
        });
    };
} 