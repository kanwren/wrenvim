{
  flake.nixvimModules.wrenvim.colorschemes = {
    catppuccin = {
      enable = true;
      settings.integrations = {
        which_key = true;
      };
    };
  };
}
