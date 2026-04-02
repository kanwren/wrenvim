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
              keys = "C";
              filter = "reduce inputs as $_ (0; . + 1)";
              args = [ "--null-input" ];
              desc = "Count";
            }
            {
              keys = "E";
              filter = "to_entries";
              desc = "To entries";
            }
            {
              keys = "F";
              filter = "from_entries";
              desc = "From entries";
            }
            {
              keys = "G";
              filter = "reduce inputs as $x ({}; .[$x.key] += [$x.value])";
              args = [ "--null-input" ];
              desc = "Gather by key";
            }
            {
              keys = "I";
              filter = "transpose[]";
              args = [ "--slurp" ];
              desc = "Interleave arrays";
            }
            {
              keys = "J";
              filter = ".";
              desc = "Format JSON";
            }
            {
              keys = "K";
              filter = "keys";
              desc = "Keys";
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
              desc = "Slurp into array";
            }
            {
              keys = "T";
              filter = "transpose";
              desc = "Transpose arrays";
            }
            {
              keys = "V";
              filter = ".[]";
              desc = "Values";
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
