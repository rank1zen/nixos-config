{
  description = "NixOS Configurations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri-flake = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs =
    { self
    , nixpkgs
    , home-manager
    , niri-flake
    , ...
    } @ inputs:
    let
      inherit (self) outputs;
    in
    {
      formatter.x86_64-linux = nixpkgs.legacyPackages."x86_64-linux".nixpkgs-fmt;

      nixosConfigurations."n00" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs outputs;
        };
        modules = [
          home-manager.nixosModules.home-manager
          ./hosts/n00/configuration.nix
        ];
      };
    };
}
