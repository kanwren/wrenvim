{
  inputs,
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
        config.allowUnfreePredicate = p: builtins.elem (lib.getName p) allowedUnfreePackages;
      };
    };
}
