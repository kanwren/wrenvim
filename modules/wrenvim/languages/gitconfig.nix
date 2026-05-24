{
  flake.nixvimModules.wrenvim = {
    ftplugin.gitconfig = /* lua */ ''
      vim.bo.expandtab = false
    '';
  };
}
