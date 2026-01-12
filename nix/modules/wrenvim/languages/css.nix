{
  flake.nixvimModules.wrenvim = {
    lsp.servers = {
      cssls.enable = true;
      emmet_ls.enable = true;
    };
  };
}
