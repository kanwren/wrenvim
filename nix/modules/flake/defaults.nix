{
  perSystem =
    { config, ... }:
    {
      packages.default = config.packages.wrenvim;
    };
}
