{
  flake.nixvimModules.wrenvim = {
    ftplugin.python = /* lua */ ''
      vim.bo.smartindent = false
      vim.opt.foldmethod = 'indent'
    '';
  };
}
