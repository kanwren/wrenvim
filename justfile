set unstable := true
set shell := ["/bin/sh", "-e", "-u", "-o", "pipefail", "-c"]
set script-interpreter := ["/bin/sh", "-e", "-u", "-o", "pipefail"]

# Show this list
[private]
list-recipes:
    @just --list --unsorted --list-prefix '    '

# Run formatters over all files
fmt:
    nix fmt .

# Run flake checks
check:
    nix flake check
