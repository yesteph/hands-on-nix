with (import <nixpkgs> {});

mkShell { buildInputs = [ python27Full ]; }
