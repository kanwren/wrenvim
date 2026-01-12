{
  flake.nixvimModules.wrenvim = {
    ftplugin.gitcommit = /* lua */ ''
      vim.bo.textwidth = 72
    '';
  };
}
