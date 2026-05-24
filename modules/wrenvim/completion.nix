{
  flake.nixvimModules.wrenvim = {
    opts = {
      completeopt = [
        "menuone" # still use the popup menu when there's only one match
        "noselect" # don't pre-select a menu item
        "popup" # show extra information about the current item in a popup
      ];

      wildmode = [
        "longest:list" # on first press, complete to longest common string, or list all options otherwise
        "full" # on second press, complete the next full match
      ];
    };

    lsp.onAttach = /* lua */ ''
      vim.lsp.completion.enable(true, client.id, bufnr, {
        autotrigger = true,
        convert = function(item)
          return { abbr = item.label:gsub("%b()", "") }
        end,
      })
    '';
  };
}
