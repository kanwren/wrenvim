{
  flake.nixvimModules.wrenvim = {
    opts = {
      # line numbering
      number = true;
      relativenumber = true;

      # cursor behavior
      virtualedit = "all"; # cursor can go anywhere

      # mouse
      mouse = "nv"; # enable the mouse in normal and visual mode

      # can the cursor move to the next/previous line by moving
      # forwards/backwards?
      whichwrap = {
        "<" = true; # left (normal/visual)
        ">" = true; # right (normal/visual)
        "[" = true; # left (insert/replace)
        "]" = true; # right (normal/visual)
        "b" = true; # backspace
        "s" = true; # space
      };
    };

    keymaps = [
      {
        # j uses visual line if no count
        key = "j";
        action = "(v:count == 0 ? 'gj' : 'j')";
        mode = [
          "n"
          "x"
          "o"
        ];
        options = {
          silent = true;
          expr = true;
        };
      }
      {
        # k uses visual line if no count
        key = "k";
        action = "(v:count == 0 ? 'gk' : 'k')";
        mode = [
          "n"
          "x"
          "o"
        ];
        options = {
          silent = true;
          expr = true;
        };
      }
      {
        # don't autojump forwards on *
        key = "*";
        action = "<cmd>let wv=winsaveview()<CR>*<cmd>call winrestview(wv)<CR>";
        mode = "n";
        options = {
          desc = "Search word forwards";
          silent = true;
        };
      }
    ];

    # Return to last position when opening file
    autoGroups."wrenvim.restore_position" = { };
    autoCmd = [
      {
        event = "BufReadPost";
        group = "wrenvim.restore_position";
        callback.__raw = /* lua */ ''
          function()
            local buf = vim.api.nvim_get_current_buf()
            local mark = vim.api.nvim_buf_get_mark(buf, '"')
            local line_count = vim.api.nvim_buf_line_count(buf)
            if mark[1] > 0 and mark[1] <= line_count then
              pcall(vim.api.nvim_win_set_cursor, 0, mark)
              vim.api.nvim_feedkeys('zvzz', 'n', true)
            end
          end
        '';
      }
    ];

    plugins = {
      # screen navigation
      leap = {
        enable = true;
        luaConfig.post = /* lua */ ''
          local leap = require('leap')
          leap.opts.safe_labels = {}
          vim.keymap.set('n', 'S', '<Plug>(leap)')
          vim.keymap.set({ 'x', 'o' }, 'S', '<Plug>(leap)')
          vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })
        '';
        lazyLoad.settings.keys = [
          {
            __unkeyed-1 = "S";
            mode = [
              "n"
              "x"
              "o"
            ];
          }
        ];
      };
    };
  };
}
