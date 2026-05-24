{
  flake.nixvimModules.wrenvim = {
    lsp.servers.texlab.enable = true;

    ftplugin.tex = /* lua */ ''
      vim.opt.conceallevel = 0
      vim.bo.textwidth = 80
      vim.opt.breakindent = true
      vim.opt.formatoptions:append('t')
    '';
  };
}
