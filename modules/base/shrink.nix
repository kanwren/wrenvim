{
  flake.nixvimModules.wrenvim = { lib, ... }: {
    # Disable some default-on features that are a particular space burden; these
    # will get turned back on in other modules.
    withNodeJs = lib.mkDefault false;
    withPerl = lib.mkDefault false;
    withPython3 = lib.mkDefault false;
    withRuby = lib.mkDefault false;
  };
}
