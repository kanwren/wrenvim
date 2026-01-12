{
  flake.nixvimModules.wrenvim = {
    plugins = {
      git-conflict.enable = true;

      gitlinker = {
        enable = true;
        settings.mappings = "<Leader>gy";
      };

      gitsigns = {
        enable = true;
        settings.on_attach.__raw = /* lua */ ''
          function(bufnr)
            local gs = package.loaded.gitsigns
            vim.keymap.set({ 'n' },      ']h',           function() if vim.wo.diff then return ']c' end vim.schedule(function() gs.next_hunk() end) return '<Ignore>' end, { desc = 'Next hunk', expr = true, buffer = bufnr })
            vim.keymap.set({ 'n' },      '[h',           function() if vim.wo.diff then return '[c' end vim.schedule(function() gs.prev_hunk() end) return '<Ignore>' end, { desc = 'Previous hunk', expr = true, buffer = bufnr })
            vim.keymap.set({ 'n' },      '<Leader>gl',   function() gs.blame_line { full = true } end,                                                                     { desc = 'Blame line', buffer = bufnr })
            vim.keymap.set({ 'n', 'x' }, '<Leader>ghs',  ':Gitsigns stage_hunk<CR>',                                                                                       { desc = 'Stage hunk', buffer = bufnr })
            vim.keymap.set({ 'n', 'x' }, '<Leader>ghr',  ':Gitsigns reset_hunk<CR>',                                                                                       { desc = 'Reset hunk', buffer = bufnr })
            vim.keymap.set({ 'n' },      '<Leader>ghu',  gs.undo_stage_hunk,                                                                                               { desc = 'Undo stage hunk', buffer = bufnr })
            vim.keymap.set({ 'n' },      '<Leader>ghp',  gs.preview_hunk,                                                                                                  { desc = 'Preview hunk', buffer = bufnr })
            vim.keymap.set({ 'n' },      '<Leader>gbdi', gs.diffthis,                                                                                                      { desc = 'Diff against index', buffer = bufnr })
            vim.keymap.set({ 'n' },      '<Leader>gbdp', function() gs.diffthis('~') end,                                                                                  { desc = 'Diff against parent', buffer = bufnr })
            vim.keymap.set({ 'n' },      '<Leader>gbdd', function() gs.diffthis(vim.fn.input('ref: '):match('^%s*(.-)%s*$')) end,                                          { desc = 'Custom diff', buffer = bufnr })
            vim.keymap.set({ 'n' },      '<Leader>gbs',  gs.stage_buffer,                                                                                                  { desc = 'Stage buffer', buffer = bufnr })
            vim.keymap.set({ 'n' },      '<Leader>gbr',  gs.reset_buffer,                                                                                                  { desc = 'Reset buffer', buffer = bufnr })
            vim.keymap.set({ 'n' },      '<Leader>gtb',  gs.toggle_current_line_blame,                                                                                     { desc = 'Toggle line blame overlay', buffer = bufnr })
            vim.keymap.set({ 'n' },      '<Leader>gtd',  gs.toggle_deleted,                                                                                                { desc = 'Toggle deleted lines', buffer = bufnr })
          end
        '';
      };
    };

    userCommands = {
      Gitroot = {
        desc = "CD to git root";
        command.__raw = /* lua */ ''
          function()
            local result = vim.fn.system({ 'git', 'rev-parse', '--show-toplevel' })
            if vim.api.nvim_get_vvar('shell_error') ~= 0 then
              vim.notify('failed to get git root: ' .. result, vim.log.levels.ERROR)
              return
            end
            vim.cmd('cd ' .. result:gsub('\n$', ""))
          end
        '';
      };
    };
  };
}
