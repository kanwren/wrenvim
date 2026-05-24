{
  flake.nixvimModules.wrenvim = {
    plugins.none-ls.sources = {
      diagnostics.fish.enable = true;
      formatting.fish_indent.enable = true;
    };
  };
}
