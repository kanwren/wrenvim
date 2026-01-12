{
  lib,
  inputs,
  config,
  ...
}:

let
  flattenPackages =
    path: value:
    if lib.isDerivation value then
      { ${lib.concatStringsSep "/" path} = value; }
    else if lib.isAttrs value then
      lib.concatMapAttrs (key: flattenPackages (path ++ [ key ])) value
    else
      { };
in

{
  flake.overlays.default =
    final: prev:
    let
      scope = prev.lib.makeScope final.newScope (_: {
        inherit inputs;
      });
    in
    {
      ${config.flake.meta.name} = prev.lib.filesystem.packagesFromDirectoryRecursive {
        directory = ../../pkgs/by-name;
        inherit (scope) newScope callPackage;
      };
    };

  perSystem =
    { pkgs, ... }:
    rec {
      # 'packages' in the makeScope output confuses flake output resolution
      legacyPackages = lib.removeAttrs pkgs.${config.flake.meta.name} [ "packages" ];

      packages = flattenPackages [ ] legacyPackages;
    };
}
