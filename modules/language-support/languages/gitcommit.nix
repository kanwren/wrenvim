{
  flake.nixvimModules."wrenvim/language-support" = {
    ftplugin.gitcommit = /* lua */ ''
      vim.bo.textwidth = 72
    '';
  };
}
