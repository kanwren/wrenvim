{
  flake.nixvimModules.wrenvim = {
    plugins.none-ls.sources = {
      formatting.just.enable = true;
    };
  };
}
