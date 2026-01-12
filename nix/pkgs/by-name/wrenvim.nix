{
  inputs,
  stdenv,
  ...
}:

let
  inherit (stdenv.buildPlatform) system;
in

inputs.self.nixvimConfigurations.${system}.wrenvim.config.build.package
