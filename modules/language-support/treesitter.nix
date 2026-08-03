{
  flake.nixvimModules.wrenvim = {
    plugins = {
      treesitter = {
        enable = true;
        highlight.enable = true;
        indent.enable = true;
      };
      ts-context-commentstring.enable = true;
    };
  };
}
