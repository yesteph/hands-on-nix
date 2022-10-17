# Exercice 3 - Nix shell

Dans cet exercice, nous allons explorer les fonctionnalités offertes par le shell Nix.

## Bobby

Inspecter le contenu fichier `shell.nix` dans le dossier `bobby`.

Que fait ce fichier ?

Lancer un shell Nix et vérifier la version de Python disponible:
```bash
cd bobby
nix-shell

python --version
```

## Charlie

Faites maintenant le même exercice pour l'application `charlie`.
```bash
cd charlie

# vim shell.nix
with (import <nixpkgs> {});

mkShell { 
  buildInputs = [ python310 python310Packages.pip ]; 

  shellHook = ''
    export PIP_PREFIX=$(pwd)/_build/pip_packages
    export PYTHONPATH="$PIP_PREFIX/${python310.sitePackages}:$PYTHONPATH"
    export PATH="$PIP_PREFIX/bin:$PATH"
  '';
}


nix-shell

python --version
```

Vérifier la bonne exécution de l'application
```bash
pip install --user -r requirements.txt

python charlie.py
```


>**Attention:** la version de Python requise est différente (Python 3.10)