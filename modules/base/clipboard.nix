{
  flake.nixvimModules.wrenvim = {
    keymaps = [
      {
        key = "<Leader>y";
        action = "\"+y";
        mode = [
          "n"
          "v"
        ];
        options = {
          desc = "Yank to clipboard";
        };
      }
      {
        key = "<Leader>Y";
        action = "\"+Y";
        mode = [
          "n"
          "v"
        ];
        options = {
          desc = "Yank line to clipboard";
        };
      }
      {
        key = "<Leader>d";
        action = "\"+d";
        mode = [
          "n"
          "v"
        ];
        options = {
          desc = "Delete to clipboard";
        };
      }
      {
        key = "<Leader>D";
        action = "\"+D";
        mode = [
          "n"
          "v"
        ];
        options = {
          desc = "Delete to eol to clipboard";
        };
      }
      {
        key = "<Leader>p";
        action = "\"+p";
        mode = [
          "n"
          "v"
        ];
        options = {
          desc = "Paste after from clipboard";
        };
      }
      {
        key = "<Leader>P";
        action = "\"+P";
        mode = [
          "n"
          "v"
        ];
        options = {
          desc = "Paste before from clipboard";
        };
      }
    ];
  };
}
