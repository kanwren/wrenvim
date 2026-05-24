{ inputs, ... }:

{
  flake.overlays.default = _final: prev: {
    wrenvim =
      inputs.self.nixvimConfigurations.${prev.stdenv.hostPlatform.system}.wrenvim.config.build.package;
  };

  perSystem =
    { pkgs, config, ... }:
    {
      packages = {
        inherit (pkgs) wrenvim;
        default = config.packages.wrenvim;
      };
    };
}
