function nixify
    if [ ! -e ./.envrc ]
        echo "use nix" > .envrc
        direnv allow
    end
    set -l defaultNixTest 'with import <nixpkgs> {};
  stdenv.mkDerivation {
    name = "env";
    buildInputs = [
    bashInteractive
  ];
}'
    if not test -e default.nix
        echo $defaultNixTest > default.nix
    end
end
