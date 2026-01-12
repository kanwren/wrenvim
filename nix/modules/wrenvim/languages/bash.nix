{
  flake.nixvimModules.wrenvim = {
    lsp.servers.bashls.enable = true;
    plugins.none-ls.sources = {
      formatting.shellharden.enable = true;
    };
  };
}
