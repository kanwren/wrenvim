{
  flake.nixvimModules."wrenvim/language-support" = {
    plugins.none-ls.sources = {
      formatting.just.enable = true;
    };
  };
}
