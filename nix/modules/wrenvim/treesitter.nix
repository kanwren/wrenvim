{
  flake.nixvimModules.wrenvim = {
    plugins = {
      treesitter = {
        enable = true;
        settings = {
          ensure_installed = [ ];
          ignore_install = [ ];
          auto_install = false;
          sync_install = false;

          highlight = {
            enable = true;
            disable = [ ];
            additional_vim_regex_highlighting = false;
          };

          indent.enable = true;

          incremental_selection = {
            enable = true;
            keymaps = {
              init_selection = "+";
              node_incremental = "+";
              scope_incremental = "<CR>";
              node_decremental = "-";
            };
          };
        };

        lazyLoad.settings.event = "BufEnter";
      };

      ts-context-commentstring.enable = true;
    };
  };
}
