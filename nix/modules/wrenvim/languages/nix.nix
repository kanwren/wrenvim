{
  flake.nixvimModules.wrenvim =
    { pkgs, ... }:
    {
      lsp.servers.nixd = {
        enable = true;
        config.nixd = {
          formatting.command = [ "nixfmt" ];
        };
      };

      plugins.none-ls.sources = {
        diagnostics.statix.enable = true;
        code_actions.statix.enable = true;
      };

      plugins.lsp-format.lspServersToEnable = [ "nixd" ];

      extraPackages = [
        pkgs.nixfmt
      ];
    };
}
