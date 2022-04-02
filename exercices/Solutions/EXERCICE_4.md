# Exercice 4 - Nix shell

Dans cet exercice, nous allons explorer les fonctionnalités offertes par le Nix shell.

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
mkShell { buildInputs = [ python39 ]; }


nix-shell

python --version
```

Vérifier la bonne exécution de l'application
```bash
pip install -r requirements.txt

python charlie.py
```


>**Attention:** la version de Python requise est différente