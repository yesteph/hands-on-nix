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


## Ajout d'une nouvelle dépendance

Maintenant que nous avons configuré notre nix shell pour utliser Niv, nous allons ajouter une nouvelle dépendance.

Ajouter le dépôt `nix-community/NUR` comme dépendance de notre application.

Ajouter le programme `hello-nur` issue de ce dépôt dans le nix shell. Vous pouvez vous aider de [ce site](https://nur.nix-community.org/) pour trouver le package associé.

Vérifiez sa bonne installation en lançant la commande `hello`.
