{
  flake.nixvimModules."wrenvim/language-support" = {
    lsp.servers = {
      cssls.enable = true;
      emmet_ls.enable = true;
    };
  };
}
