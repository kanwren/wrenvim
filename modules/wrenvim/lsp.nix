{
  flake.nixvimModules.wrenvim = {
    lsp = {
      inlayHints.enable = false;
      keymaps = [
        {
          key = "gd";
          action.__raw = /* lua */ ''require("telescope.builtin").lsp_definitions'';
          mode = [ "n" ];
          options = {
            desc = "Goto definition";
            silent = true;
          };
        }
        {
          key = "grt";
          action.__raw = /* lua */ ''require("telescope.builtin").lsp_type_definitions'';
          mode = [ "n" ];
          options = {
            desc = "List type definitions";
            silent = true;
          };
        }
        {
          key = "gO";
          action.__raw = /* lua */ ''require("telescope.builtin").lsp_document_symbols'';
          mode = [ "n" ];
          options = {
            desc = "Document symbols";
            silent = true;
          };
        }
        {
          key = "grci";
          action.__raw = /* lua */ ''require("telescope.builtin").lsp_incoming_calls'';
          mode = [ "n" ];
          options = {
            desc = "Incoming calls";
            silent = true;
          };
        }
        {
          key = "grco";
          action.__raw = /* lua */ ''require("telescope.builtin").lsp_outgoing_calls'';
          mode = [ "n" ];
          options = {
            desc = "Outgoing calls";
            silent = true;
          };
        }
        {
          key = "<Leader><CR>";
          lspBufAction = "format";
          mode = [ "n" ];
          options = {
            desc = "Format buffer";
            silent = true;
          };
        }
      ];
    };

    plugins.lspconfig.enable = true;

    plugins.none-ls.enable = true;
  };
}
