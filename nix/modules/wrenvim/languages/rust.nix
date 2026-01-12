{
  flake.nixvimModules.wrenvim = {
    lsp.servers.rust_analyzer = {
      enable = true;
      config."rust-analyzer" = {
        assist = {
          importMergeBehavior = "last";
          importPrefix = "by_self";
        };
        cargo = {
          loadOutDirsFromCheck = true;
        };
        procMacro.enable = true;
      };
    };
    plugins.lsp-format.lspServersToEnable = [ "rust_analyzer" ];
  };
}
