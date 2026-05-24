{
  flake.nixvimModules.wrenvim =
    { pkgs, ... }:
    {
      userCommands = {
        Scratch = {
          desc = "Open scratch buffer";
          command = /* vim */ ''new | setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile'';
        };
      };

      extraPlugins = [
        {
          plugin = pkgs.vimPlugins.vim-eunuch; # file operations
          optional = true;
        }
      ];

      plugins.lz-n.plugins = [
        {
          __unkeyed-1 = "vim-eunuch";
          cmd = [
            "Remove"
            "Unlink"
            "Delete"
            "Copy"
            "Duplicate"
            "Move"
            "Rename"
            "Chmod"
            "Mkdir"
            "Mkdir"
            "Cfind"
            "Lfind"
            "Clocate"
            "Llocate"
            "SudoEdit"
            "SudoWrite"
            "Wall"
          ];
        }
      ];
    };
}
