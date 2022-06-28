with (import <nixpkgs> {});

mkShell { 
  buildInputs = [ python39 python39Packages.pip ]; 

  shellHook = ''
    export PIP_PREFIX=$(pwd)/_build/pip_packages
    export PYTHONPATH="$PIP_PREFIX/${python39.sitePackages}:$PYTHONPATH"
    export PATH="$PIP_PREFIX/bin:$PATH"
    # maybe set more env-vars
  '';
}