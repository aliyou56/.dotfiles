{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-utils = {
      url = "github:numtide/flake-utils";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    home-manager,
    ...
  }: let
    supportedSystems = [
      "aarch64-darwin" # mac (apple sillicon)
      "x86_64-linux" # linux (most distro)
    ];
  in
    flake-utils.lib.eachSystem supportedSystems (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        formatter = pkgs.alejandra;

        packages.homeConfigurations.aliyou = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          modules = [
            ./home.nix
            {
              home = {
                username = "aliyou";
                homeDirectory =
                  if pkgs.stdenv.isDarwin
                  then "/Users/aliyou"
                  else "/home/aliyou";
                stateVersion = "25.05";
              };
              nixpkgs.config = {
                allowUnfree = true;
                allowUnfreePredicate = _: true;
              };
              programs.home-manager.enable = true;
            }
          ];
        };
      }
    );
}
