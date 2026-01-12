{
  flake.nixvimModules.wrenvim = {
    opts = {
      # indent with 4 spaces by default
      tabstop = 4;
      softtabstop = 4;
      shiftwidth = 4;
      expandtab = true;

      # wrapping
      wrap = false;
      textwidth = 80;

      # autoformatting
      cinoptions = [
        ":0" # 'case' should be inline with 'switch'
        "L0" # labels should be inline with block
        "g0" # C++ scope declarations should be inline with block
        "j1" # indent Java anonymous classes correctly
        "J1" # indent JS object declarations correctly
        "#0" # don't indent pragma lines
      ];
      formatoptions = {
        "c" = true; # autowrap comments
        "r" = true; # insert comment leader on enter in insert mode
        "o" = true; # insert comment leader on 'o' or 'O' if current line has one
        "q" = true; # format comments with gq
        "j" = true; # remove comment leaders when joining lines
        "l" = true; # don't autobreak long lines in insert mode if they started that way
        "n" = true; # recognize numbered lists
        "t" = false; # don't autowrap text
      };
      comments = [
        "s1:/*"
        "mb:*"
        "ex:*/"
        "://"
        "b:#"
        ":%"
        ":XCOMM"
        "fb:-"
        "fb:•"
        # "n:>"
      ];
    };

    plugins.lsp-format.enable = true;
  };
}
