{
  flake.nixvimModules.wrenvim = {
    ftplugin.markdown = /* lua */ ''
      vim.bo.formatoptions = 'croqjlnt'
      vim.opt.breakindent = true
    '';
  };
}
