{
  flake.nixvimModules.wrenvim = {
    opts = {
      # don't adjust trailing newlines automatically
      fixendofline = false;

      # key code sequence completion timeout
      ttimeoutlen = 0;
    };

    keymaps = [
      {
        # repeat commands across visual selections
        key = ".";
        action = ":normal .<CR>";
        mode = "x";
        options = {
          desc = "Repeat linewise";
          silent = true;
        };
      }
      {
        # split current line by provided regex (\zs or \ze to preserve separators)
        key = "gs";
        action = '':s//\r/g<Left><Left><Left><Left><Left>'';
        mode = "n";
        options.desc = "Regex split line";
      }
      {
        # start a visual substitute
        key = "gs";
        action = '':s/\%V'';
        mode = "x";
        options.desc = "Visual substitute";
      }
    ];

    plugins = {
      # multicursors
      visual-multi = {
        enable = true;
        settings = {
          leader = ''\'';
          default_mappings = 1;
          maps = {
            "Add Cursor Down" = "<C-j>";
            "Add Cursor Up" = "<C-k>";
          };
          mouse_mappings = 0;
          show_warnings = 1;
          silent_exit = 0;
        };
      };

      # manipulating paired delimiters
      mini-surround = {
        enable = true;
        settings = {
          respect_selection_type = true;
        };
        lazyLoad.settings.keys = [
          {
            __unkeyed-1 = "sa";
            mode = [
              "n"
              "v"
            ];
          }
          {
            __unkeyed-1 = "sd";
            mode = [ "n" ];
          }
          {
            __unkeyed-1 = "sf";
            mode = [ "n" ];
          }
          {
            __unkeyed-1 = "sF";
            mode = [ "n" ];
          }
          {
            __unkeyed-1 = "sh";
            mode = [ "n" ];
          }
          {
            __unkeyed-1 = "sr";
            mode = [ "n" ];
          }
        ];
      };

      # autopairs
      mini-pairs.enable = true;

      # more operators
      mini-operators = {
        enable = true;
        settings = {
          evaluate.prefix = "g=";
          exchange = {
            prefix = "gx";
            reindent_linewise = false;
          };
          multiply.prefix = "";
          replace.prefix = "";
          sort.prefix = "";
        };
        lazyLoad.settings.keys = [
          {
            __unkeyed-1 = "g=";
            mode = [
              "n"
              "v"
            ];
          }
          {
            __unkeyed-1 = "gx";
            mode = [
              "n"
              "v"
            ];
          }
        ];
      };

      # switch between single-line and multiline constructs
      treesj = {
        enable = true;
        settings = {
          use_default_keymaps = false;
          max_join_length = 512;
        };
        lazyLoad.settings.keys = [
          {
            __unkeyed-1 = "g<Space>";
            __unkeyed-2 = "<cmd>TSJToggle<CR>";
            mode = [ "n" ];
            desc = "Toggle node split";
          }
        ];
      };

      # repeat more things with '.'
      repeat = {
        enable = true;
      };
    };
  };
}
