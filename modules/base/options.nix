# TODO: split these up by purpose

{
  flake.nixvimModules.wrenvim.opts = {
    spelllang = "en_us";

    # persistent file state
    swapfile = true;
    undofile = true;
    backup = true;
    backupdir.__raw = /* lua */ ''vim.fn.stdpath('state') .. "backup//"'';

    # diff algorithm
    diffopt = [
      "internal"
      "filler"
      "closeoff"
      "linematch:40"
      "algorithm:patience"
    ];

    # vi compat options
    cpoptions = {
      "A" = true; # :write sets alternate file
      "B" = true; # \ does not act as an auxiliary ^V
      "F" = true; # :write sets the file name if unset
      "_" = false; # cw DOES count whitespace
      "a" = true; # :read sets alternate file
      "c" = true; # next search starts at end of current match
      "e" = true; # flush command line after running macros with :@
      "s" = true; # set buffer options when buffer entered for the first time
      "y" = true; # yank can be repeated with .
    };
  };
}
