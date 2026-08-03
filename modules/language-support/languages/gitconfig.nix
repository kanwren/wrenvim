{
  flake.nixvimModules."wrenvim/language-support" = {
    ftplugin.gitconfig = /* lua */ ''
      vim.bo.expandtab = false
    '';
  };
}
