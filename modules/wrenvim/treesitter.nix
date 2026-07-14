{
  flake.nixvimModules.wrenvim = {
    plugins = {
      treesitter.enable = true;
      ts-context-commentstring.enable = true;
    };

    autoCmd = [
      {
        event = "FileType";
        callback.__raw = /* lua */ ''
          function(ev)
            local _, err = vim.treesitter.get_parser(ev.buf)
            if not err then
              vim.treesitter.start(ev.buf)
              vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end
          end
        '';
      }
    ];
  };
}
