{
  flake.nixvimModules.wrenvim = {
    globals.mapleader = " ";
    keymaps = [
      {
        key = "<Space>";
        action = "<NOP>";
        mode = [
          "n"
          "x"
          "o"
        ];
        options.remap = true;
      }
      {
        key = "<S-Space>";
        action = "<Space>";
        mode = [
          "n"
          "x"
          "o"
        ];
        options.remap = true;
      }
    ];
  };
}
