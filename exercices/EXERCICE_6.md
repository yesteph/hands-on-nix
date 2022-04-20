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


## Mettre à jour une dépendance

Comme vous avez pu le remarquer, la dépendance nixpkgs, pointe sur une branche définie.

Afin d'avoir les dérivations les plus récentes, nous souhaitons référencer la branche master.

Mettre à jour la dépendance nixpkgs pour utliser la branche master du dépôt.
