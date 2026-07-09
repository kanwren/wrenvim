{
  config,
  inputs,
  ...
}:

{
  perSystem =
    { system, pkgs, ... }:
    {
      nixvimConfigurations.wrenvim = inputs.nixvim.lib.evalNixvim {
        modules = [
          {
            nixpkgs = {
              hostPlatform.system = system;
              inherit (pkgs) config;
            };
          }
          config.flake.nixvimModules.wrenvim
        ];
      };
    };

  flake = {
    nixvimModules.wrenvim = {
      imports = [
        config.flake.nixvimModules.ftplugin
      ];
      plugins.lz-n.enable = true;
      performance = {
        byteCompileLua = {
          enable = true;
          configs = true;
          initLua = true;
          luaLib = true;
          nvimRuntime = true;
          plugins = true;
        };
        combinePlugins = {
          enable = true;
          standalonePlugins = [
            "friendly-snippets"
          ];
        };
      };
    };

    modules.nixos.wrenvim =
      { pkgs, ... }:
      {
        environment = {
          variables = {
            EDITOR = "nvim";
            VISUAL = "nvim";
          };
          systemPackages = [
            pkgs.wrenvim
          ];
        };
      };

    modules.homeManager.wrenvim =
      { pkgs, ... }:
      {
        home = {
          sessionVariables = {
            EDITOR = "nvim";
            VISUAL = "nvim";
          };
          packages = [
            pkgs.wrenvim
          ];
        };
      };
  };
}
