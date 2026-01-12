{
  flake.nixvimModules.wrenvim =
    { lib, ... }:
    {
      keymaps =
        let
          jqCommand =
            {
              keys,
              filter ? ".",
              args ? [ ],
              desc,
            }:
            let
              command = lib.escapeShellArgs (
                [
                  "jq"
                  filter
                ]
                ++ args
              );
            in
            [
              {
                key = "<Leader>J${keys}";
                action = "<cmd>%! ${command}<CR>";
                mode = "n";
                options.desc = desc;
              }
              {
                key = "<Leader>J${keys}";
                action = ":! ${command}<CR>";
                mode = "x";
                options.desc = desc;
              }
            ];
          special = lib.concatMap jqCommand [
            {
              keys = "J";
              filter = ".";
              desc = "Format JSON";
            }
            {
              keys = "L";
              args = [ "--raw-input" ];
              desc = "Convert lines to JSON strings";
            }
            {
              keys = "R";
              args = [ "--raw-output" ];
              desc = "Output raw strings";
            }
            {
              keys = "S";
              args = [ "--slurp" ];
              desc = "Slurp JSON into array";
            }
            {
              keys = "V";
              filter = ".[]";
              desc = "Get all values from JSON value";
            }
            {
              keys = "E";
              filter = "to_entries";
              desc = "Entries in object";
            }
            {
              keys = "T";
              filter = "transpose";
              desc = "Transpose arrays";
            }
            {
              keys = "C";
              filter = "reduce inputs as $_ (0; . + 1)";
              args = [ "--null-input" ];
              desc = "Count JSON values";
            }
          ];
        in
        [
          {
            key = "<Leader>j";
            mode = "n";
            action = '':%!jq ''' <left><left>'';
            options.desc = "Run a jq command";
          }
          {
            key = "<Leader>j";
            mode = "x";
            action = '':!jq ''' <left><left>'';
            options.desc = "Run a jq command";
          }
        ]
        ++ special;
    };
}
