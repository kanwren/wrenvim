{
  flake.nixvimModules."wrenvim/language-support" = {
    ftplugin.markdown = /* lua */ ''
      vim.bo.formatoptions = 'croqjlnt'
      vim.opt.breakindent = true
    '';
  };
}
