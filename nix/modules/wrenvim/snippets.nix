{
  flake.nixvimModules.wrenvim = {
    plugins = {
      luasnip = {
        enable = true;
        fromVscode = [ { } ];
      };
      friendly-snippets.enable = true;
    };
  };
}
