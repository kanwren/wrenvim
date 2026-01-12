{
  inputs = {
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
    };
    import-tree = {
      url = "github:vic/import-tree";
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
    inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./nix/modules);
}
