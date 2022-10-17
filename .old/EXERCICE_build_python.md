# Exercice 6 - Nix build

## Build Python

Pour que Nix puisse build l'application bobby, il est nécessaire de lui donner des instructions.

Pour cela, créer le fichier `bobby/default.nix` avec le contenu suivant
```bash
{ pkgs ? import <nixpkgs> {} }:
pkgs.python3Packages.buildPythonApplication {
  pname = "bobby";
  version = "1.0";
  src = ./.;
  propagatedBuildInputs = [ pkgs.python39Packages.flask ];
}
```

Ce fichier est incomplet. Veillez à le compléter avant de passer à la suite.

Ensuite, lancer le build de l'application
```bash
cd bobby

nix-build
```

Inspecter les actions effectuées par Nix ainsi que la structure de ce qui est produit en sortie de la commande.

Lancer l'application à partir de l'artifact créé et vérifier son bon fonctionnement.

```bash
cd /nix/store/xxxxxxxxxxxxxxxxx/bin
./bobby.py&

curl http://localhost:9090
```

