{
  flake.nixvimModules."wrenvim/language-support" = {
    lsp.servers = {
      html.enable = true;
      emmet_ls.enable = true;
    };
  };
}
