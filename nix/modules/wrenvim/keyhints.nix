{
  flake.nixvimModules.wrenvim = {
    plugins.which-key = {
      enable = true;
      settings = {
        plugins.registers = false;

        # Prefer giving descriptions to mappings when making them; this is only
        # for creating groups and overriding the descriptions of mappings we
        # don't control.
        spec = [
          {
            __unkeyed-1 = "\\";
            group = "visual-multi";
            mode = "n";
          }
          {
            __unkeyed-1 = "\\/";
            desc = "Regex search";
            mode = "n";
          }
          {
            __unkeyed-1 = "\\A";
            desc = "Regex search";
            mode = "n";
          }
          {
            __unkeyed-1 = "cxc";
            desc = "Cancel exchange";
            mode = "n";
          }
          {
            __unkeyed-1 = "cxx";
            desc = "Exchange line";
            mode = "n";
          }
          {
            __unkeyed-1 = "cx";
            group = "exchange";
            mode = "n";
          }
          {
            __unkeyed-1 = "cxc";
            desc = "Cancel exchange";
            mode = "n";
          }
          {
            __unkeyed-1 = "cxx";
            desc = "Exchange line";
            mode = "n";
          }
          {
            __unkeyed-1 = "g+";
            desc = "Later text state";
            mode = "n";
          }
          {
            __unkeyed-1 = "g-";
            desc = "Earlier text state";
            mode = "n";
          }
          {
            __unkeyed-1 = "ga";
            desc = "Show character info";
            mode = "n";
          }
          {
            __unkeyed-1 = "gb";
            group = "block comment";
            mode = "n";
          }
          {
            __unkeyed-1 = "gbc";
            desc = "End of line";
            mode = "n";
          }
          {
            __unkeyed-1 = "gc";
            group = "line comment";
            mode = "n";
          }
          {
            __unkeyed-1 = "gcc";
            desc = "Current line";
            mode = "n";
          }
          {
            __unkeyed-1 = "gra";
            desc = "Code action";
            mode = "n";
          }
          {
            __unkeyed-1 = "grc";
            group = "callgraph";
            mode = "n";
          }
          {
            __unkeyed-1 = "gri";
            desc = "Goto implementation";
            mode = "n";
          }
          {
            __unkeyed-1 = "grn";
            desc = "Rename";
            mode = "n";
          }
          {
            __unkeyed-1 = "grr";
            desc = "Goto references";
            mode = "n";
          }
          {
            __unkeyed-1 = "yS";
            group = "surround to line";
            mode = "n";
          }
          {
            __unkeyed-1 = "ySS";
            desc = "Current line";
            mode = "n";
          }
          {
            __unkeyed-1 = "ySs";
            desc = "Current line";
            mode = "n";
          }
          {
            __unkeyed-1 = "ys";
            group = "surround";
            mode = "n";
          }
          {
            __unkeyed-1 = "yss";
            desc = "Current line";
            mode = "n";
          }
          {
            __unkeyed-1 = "S";
            desc = "Surround";
            mode = "x";
          }
          {
            __unkeyed-1 = "gS";
            desc = "Virtual surround (suppress indent)";
            mode = "x";
          }
          {
            __unkeyed-1 = "gb";
            desc = "Block comment";
            mode = "x";
          }
          {
            __unkeyed-1 = "gc";
            desc = "Line comment";
            mode = "x";
          }
          {
            __unkeyed-1 = "<Leader>g";
            group = "git";
            mode = [
              "n"
              "x"
            ];
          }
          {
            __unkeyed-1 = "<Leader>f";
            desc = "telescope";
            mode = "n";
          }
          {
            __unkeyed-1 = "<Leader>gy";
            desc = "Copy permalink";
            mode = "n";
          }
          {
            __unkeyed-1 = "<Leader>gh";
            group = "hunk";
            mode = [
              "n"
              "x"
            ];
          }
          {
            __unkeyed-1 = "<Leader>gh";
            group = "hunk";
            mode = "x";
          }
          {
            __unkeyed-1 = "<Leader>gbd";
            group = "diff";
            mode = "n";
          }
          {
            __unkeyed-1 = "<Leader>gt";
            group = "toggle";
            mode = "n";
          }
        ];
      };
    };
  };
}
