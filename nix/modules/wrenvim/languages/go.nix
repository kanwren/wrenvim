{
  flake.nixvimModules.wrenvim =
    { pkgs, ... }:
    {
      lsp.servers.gopls = {
        enable = true;
        config.gopls = {
          usePlaceholders = true;
          experimentalPostfixCompletions = true;
          analyses = {
            unusedparams = true;
            shadow = true;
            nilness = true;
          };
        };
      };

      plugins.none-ls.sources = {
        diagnostics = {
          staticcheck.enable = false; # TODO
        };
        formatting = {
          goimports.enable = true;
        };
        code_actions = {
          gomodifytags.enable = true;
          impl.enable = true;
        };
      };

      plugins.lsp-format.lspServersToEnable = [ "gopls" ];

      extraPackages = [
        pkgs.go-tools # staticcheck
        pkgs.gomodifytags
        pkgs.gotools # goimports
        pkgs.impl
      ];

      ftplugin.go = /* lua */ ''
        vim.opt.listchars:append({ tab = '  ' })
        vim.bo.expandtab = false
      '';
    };
}
