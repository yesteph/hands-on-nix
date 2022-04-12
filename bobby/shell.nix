with (import <nixpkgs> {});

mkShell { buildInputs = [ python39 python39Packages.pip ]; }