{
  config,
  inputs,
  ...
}:

let
  mkPackages = pkgs: {
    wrenvim =
      config.flake.nixvimConfigurations.${pkgs.stdenv.hostPlatform.system}.wrenvim.config.build.package.overrideAttrs
        {
          pname = "wrenvim";
          name = "wrenvim";
        };

    wrenvim-minimal =
      config.flake.nixvimConfigurations.${pkgs.stdenv.hostPlatform.system}.wrenvim-minimal.config.build.package.overrideAttrs
        {
          pname = "wrenvim";
          name = "wrenvim";
        };
  };
in
{
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

    overlays.default = final: _prev: mkPackages final;

    modules = {
      nixos.wrenvim =
        { system, ... }: config.flake.nixvimConfigurations.${system}.wrenvim.config.build.nixosModule;
      homeManager.wrenvim =
        { system, ... }: config.flake.nixvimConfigurations.${system}.wrenvim.config.build.nixosModule;
    };
  };

  perSystem =
    {
      system,
      pkgs,
      ...
    }:
    {
      nixvimConfigurations = {
        wrenvim = inputs.nixvim.lib.evalNixvim {
          modules = [
            {
              nixpkgs = {
                hostPlatform.system = system;
                inherit (pkgs) config;
              };
            }
            config.flake.nixvimModules.wrenvim
            config.flake.nixvimModules."wrenvim/language-support"
          ];
        };

        wrenvim-minimal = inputs.nixvim.lib.evalNixvim {
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

      packages =
        let
          p = mkPackages pkgs;
        in
        p // { default = p.wrenvim; };
    };
}
