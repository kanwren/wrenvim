{
  inputs = {
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
    };
    make-shell = {
      url = "github:nicknovitski/make-shell";
    };
    nixpkgs = {
      url = "github:NixOS/nixpkgs?ref=nixos-25.11";
    };
    nixvim = {
      url = "github:nix-community/nixvim?ref=main";
      inputs.systems.follows = "systems";
    };
    systems = {
      url = "github:nix-systems/default";
    };
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
    };
  };

  outputs =
    inputs:
    let
      inherit (inputs.nixpkgs) lib;
    in
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      imports = lib.fileset.toList (
        lib.fileset.fileFilter (
          f: f.type == "regular" && f.hasExt "nix" && !lib.strings.hasPrefix "_" f.name
        ) ./modules
      );
    };
}
