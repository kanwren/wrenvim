{
  inputs,
  ...
}:

{
  imports = [
    inputs.nixvim.flakeModules.default
  ];

  nixvim = {
    packages.enable = false;
    checks.enable = true;
  };
}
