{
  flake.nixvimModules.wrenvim = {
    lsp.servers = {
      html.enable = true;
      emmet_ls.enable = true;
    };
  };
}
