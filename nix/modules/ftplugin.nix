{
  flake.nixvimModules.ftplugin =
    { lib, config, ... }:
    {
      options.ftplugin = lib.mkOption {
        type = lib.types.attrsOf lib.types.str;
        default = { };
        description = ''
          ftplugin files
        '';
      };

      config.extraFiles = lib.mapAttrs' (name: value: {
        name = "after/ftplugin/${name}.lua";
        value = {
          text = value;
        };
      }) config.ftplugin;
    };
}
