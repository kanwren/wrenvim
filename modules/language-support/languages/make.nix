{
  flake.nixvimModules."wrenvim/language-support" = {
    ftplugin.make = /* lua */ ''
      vim.bo.expandtab = false
    '';
  };
}
