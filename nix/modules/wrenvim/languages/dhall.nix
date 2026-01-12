{
  flake.nixvimModules.wrenvim = {
    ftplugin.dhall = /* lua */ ''
      vim.api.nvim_command('iabbrev \\ λ')
      vim.api.nvim_command('iabbrev -> →')
      vim.api.nvim_command('iabbrev forall ∀')
    '';
  };
}
