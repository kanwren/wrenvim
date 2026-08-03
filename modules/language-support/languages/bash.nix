{
  flake.nixvimModules."wrenvim/language-support" = {
    lsp.servers.bashls.enable = true;
    plugins.none-ls.sources = {
      formatting.shellharden.enable = true;
    };
  };
}
