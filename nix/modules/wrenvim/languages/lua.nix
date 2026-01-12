{
  flake.nixvimModules.wrenvim = {
    lsp.servers.lua_ls = {
      enable = true;
      config.Lua = {
        runtime.version = "LuaJIT";
        diagnostics.globals = "vim";
        workspace = {
          library.__raw = /* lua */ ''vim.api.nvim_get_runtime_file("", true)'';
          checkThirdParty = false;
        };
        telemetry.enable = false;
      };
    };
    plugins.lsp-format.lspServersToEnable = [ "lua_ls" ];
  };
}
