# Exercice 6 - Niv

Dans cet exercice, nous allons voir comment utliser l'outil Niv pour gérer nos dépendances Nix

## Installation

Installer Niv
```bash
nix-env -iA nixpkgs.niv
```

Initialiser Niv pour charlie
```bash
cd charlie

niv init
```

Inspecter le contenu du répertoire `nix` fraichement créé.

Identifier la version de nixpkgs utilisée.

## Configuration de Nix shell

Pour utiliser Niv dans notre shell, il est nécessaire de modifier notre fichier `shell.nix`. 

Adapter ce fichier pour charger les dépendances définies dans `nix/sources.json`

```bash
# vim shell.nix
{ sources ? import ./nix/sources.nix }: # import the sources
let
  pkgs = import sources.nixpkgs { }; # define variable for nixpkgs
in
pkgs.mkShell { 
  buildInputs =  [
    pkgs.python310
    pkgs.python310Packages.pip
  ]; 
    
  shellHook = ''
    export PIP_PREFIX=$(pwd)/_build/pip_packages
    export PYTHONPATH="$PIP_PREFIX/${pkgs.python310.sitePackages}:$PYTHONPATH"
    export PATH="$PIP_PREFIX/bin:$PATH"
  '';
}
```

## Mettre à jour une dépendance

Comme vous avez pu le remarquer, la dépendance nixpkgs, pointe sur une branche définie.

Afin d'avoir les dérivations les plus récentes, nous souhaitons référencer la branche master.

Mettre à jour la dépendance nixpkgs pour utliser la branche master du dépôt.

```bash
niv update nixpkgs -b master

cat nix/sources.json # On vérifie que nixpkgs pointe bien sur master
```