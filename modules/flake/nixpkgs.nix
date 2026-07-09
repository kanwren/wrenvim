{
  inputs,
  config,
  lib,
  ...
}:

let
  allowedUnfreePackages = [
    "git-conflict.nvim"
  ];
in
{
  perSystem =
    { system, ... }:
    {
      _module.args.pkgs = import inputs.nixpkgs {
        inherit system;

        overlays = [
          config.flake.overlays.default
        ];

        config.allowUnfreePredicate = p: builtins.elem (lib.getName p) allowedUnfreePackages;
      };
    };
}
