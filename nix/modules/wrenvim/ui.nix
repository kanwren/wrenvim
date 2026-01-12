{
  flake.nixvimModules.wrenvim =
    { pkgs, ... }:
    {
      opts = {
        # don't redraw while executing macros
        lazyredraw = true;

        # splits
        splitbelow = true;
        splitright = true;

        # position indicators
        cursorline = true;
        colorcolumn = "+1";

        # signs
        signcolumn = "yes";

        # folds
        foldenable = true;
        foldlevelstart = 99;

        # list mode
        list = true;
        listchars = {
          eol = "¬";
          extends = ">";
          nbsp = "⎵";
          precedes = "<";
          tab = "␉·";
        };

        # flash matches when typing brackets
        showmatch = true;

        # max items in popup completion menu
        pumheight = 20;

        # messages
        shortmess = {
          "C" = true; # no messages while completing
          "F" = true; # don't give file info when editing a file
          "I" = true; # don't give the intro message on startup
          "O" = true; # warn to reread a file overwrites any other messages
          "T" = true; # truncate long messages in the middle
          "l" = true; # abbreviate line/byte counts
          "o" = true; # warn to reread a file if necessary during writing
          "t" = true; # truncate long file message at start
        };
      };

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

      # diagnostic display settings
      diagnostic.settings = {
        virtual_text = {
          prefix = "~";
          spacing = 5;
        };
        signs = true;
        underline = true;
      };

      plugins = {
        # statusline
        lualine = {
          enable = true;
          settings = {
            options = {
              theme = "catppuccin";
              globalstatus = true;
            };
            extensions = [
              "nvim-tree"
            ];
            sections = {
              lualine_a = [
                "mode"
              ];
              lualine_b = [
                "branch"
                "diff"
                "diagnostics"
              ];
              lualine_c = [
                {
                  __unkeyed-1 = "filename";
                  path = 1;
                }
              ];
              lualine_x = [
                { __raw = /* lua */ ''function() return vim.bo.eol and "eol" or "noeol" end''; }
                "encoding"
                "fileformat"
                "filetype"
              ];
              lualine_y = [
                "progress"
              ];
              lualine_z = [
                "location"
              ];
            };
            winbar = {
              lualine_c = [ "filename" ];
            };
            inactive_winbar = {
              lualine_c = [ "filename" ];
            };
          };
        };

        # fuzzy picker
        telescope = {
          enable = true;
          lazyLoad.settings.keys =
            let
              mapPicker =
                {
                  key,
                  picker,
                  desc,
                }:
                {
                  __unkeyed-1 = "<Leader>f${key}";
                  __unkeyed-2 = "<cmd>Telescope ${picker}<CR>";
                  inherit desc;
                  mode = [ "n" ];
                };
            in
            [
              (mapPicker {
                key = "f";
                picker = "find_files";
                desc = "files";
              })
              (mapPicker {
                key = "g";
                picker = "git_files";
                desc = "git files";
              })
              (mapPicker {
                key = "r";
                picker = "live_grep";
                desc = "live grep";
              })
              (mapPicker {
                key = "b";
                picker = "buffers";
                desc = "buffers";
              })
              (mapPicker {
                key = "h";
                picker = "help_tags";
                desc = "help tags";
              })
              (mapPicker {
                key = "s";
                picker = "treesitter";
                desc = "treesitter symbols";
              })
              (mapPicker {
                key = "<CR>";
                picker = "resume";
                desc = "resume last picker";
              })
              (mapPicker {
                key = "t";
                picker = "tagstack";
                desc = "tagstack";
              })
              (mapPicker {
                key = "T";
                picker = "tags";
                desc = "tags";
              })
              (mapPicker {
                key = "m";
                picker = "marks";
                desc = "marks";
              })
              (mapPicker {
                key = "o";
                picker = "oldfiles";
                desc = "recent files";
              })
              (mapPicker {
                key = ":";
                picker = "commands";
                desc = "commands";
              })
              (mapPicker {
                key = "v";
                picker = "vim_options";
                desc = "vim options";
              })
              (mapPicker {
                key = "k";
                picker = "keymaps";
                desc = "keymaps";
              })
              (mapPicker {
                key = "F";
                picker = "filetypes";
                desc = "filetypes";
              })
              (mapPicker {
                key = "j";
                picker = "jumplist";
                desc = "jumplist";
              })
              (mapPicker {
                key = "q";
                picker = "quickfix";
                desc = "quickfix";
              })
              (mapPicker {
                key = "l";
                picker = "loclist";
                desc = "loclist";
              })
              (mapPicker {
                key = "/";
                picker = "current_buffer_fuzzy_find skip_empty_lines=true";
                desc = "fuzzy find in buf";
              })
              (mapPicker {
                key = "P";
                picker = "builtin include_extensions=true";
                desc = "pickers";
              })
              (mapPicker {
                key = "d";
                picker = "diagnostics bufnr=0";
                desc = "diagnostics";
              })
              (mapPicker {
                key = "D";
                picker = "diagnostics";
                desc = "workspace diagnostics";
              })
            ];
        };

        # icons
        web-devicons.enable = true;

        # nicer components, like a better vim.ui.input for renaming
        dressing = {
          enable = true;
          settings.select.enabled = false;
        };
        telescope.extensions.ui-select = {
          enable = true;
        };

        # LSP status indicator
        fidget = {
          enable = true;
        };

        # indent guides
        indent-blankline = {
          enable = true;
          luaConfig.post = /* lua */ ''
            local ibl = require('ibl')
            ibl.setup({
              enabled = true,
              scope = {
                enabled = true,
              },
              indent = {
                char = '│',
              },
            })
          '';
        };

        # undo tree
        undotree = {
          enable = true;
        };

        # highlight trailing whitespace
        mini-trailspace = {
          enable = true;
          settings = {
            only_in_normal_buffers = true;
          };
        };

        # show hex codes as colors: #b4befe, #94e2d5
        colorizer =
          let
            filetypes = [
              "css"
              "html"
              "javascript"
              "javascriptreact"
              "lua"
              "typescript"
              "typescriptreact"
              "vim"
            ];
          in
          {
            enable = true;
            settings = {
              inherit filetypes;
            };
            lazyLoad.settings.ft = filetypes;
          };
      };

      keymaps = [
        {
          key = "<C-l>";
          action = "<cmd>nohlsearch<CR><C-l>";
          mode = [
            "n"
            "v"
            "o"
          ];
          options = {
            desc = "Redraw";
            silent = true;
          };
        }
        {
          key = "<Leader>u";
          action = "<cmd>UndotreeToggle<CR>";
          mode = [ "n" ];
          options.desc = "Toggle undo tree";
        }
      ];

      extraPlugins = [
        {
          plugin = pkgs.vimPlugins.vim-characterize; # more character metadata in 'ga' output
          optional = true;
        }
      ];

      plugins.lz-n.plugins = [
        {
          __unkeyed-1 = "vim-characterize";
          keys = [
            {
              __unkeyed-1 = "ga";
              mode = [
                "n"
                "v"
              ];
            }
          ];
        }
      ];
    };
}
