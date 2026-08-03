{
  flake.nixvimModules."wrenvim/language-support" = {
    ftplugin.python = /* lua */ ''
      vim.bo.smartindent = false
      vim.opt.foldmethod = 'indent'
    '';
  };
}
