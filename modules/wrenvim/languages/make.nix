{
  flake.nixvimModules.wrenvim = {
    ftplugin.make = /* lua */ ''
      vim.bo.expandtab = false
    '';
  };
}
