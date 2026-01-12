{
  flake.nixvimModules.wrenvim = {
    keymaps = [
      {
        key = "af";
        action = ":<C-u>silent! normal! gg0VG$<CR>";
        mode = "v";
        options.desc = "Around file";
      }
      {
        key = "af";
        action = ":normal Vaf<CR>";
        mode = "o";
        options = {
          desc = "Around file";
          remap = true;
        };
      }

      {
        key = "il";
        action = ":<C-u>silent! normal! ^vg_<CR>";
        mode = "v";
        options.desc = "Inner line";
      }
      {
        key = "il";
        action = ":normal vil<CR>";
        mode = "o";
        options = {
          desc = "Inner line";
          remap = true;
        };
      }

      {
        key = "al";
        action = ":<C-u>silent! normal! 0v$<CR>";
        mode = "v";
        options.desc = "Around line";
      }
      {
        key = "al";
        action = ":normal val<CR>";
        mode = "o";
        options = {
          desc = "Around line";
          remap = true;
        };
      }
    ];
  };
}
