{
  description = "My custom package collection";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
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
        in
        import ./default.nix {
          inherit pkgs;
        } // {
          # Set one of your packages as default, for example hyprland
          default = (import ./default.nix { inherit pkgs; }).waybar;
        }
      );
    };
} 
