# Exercice 3 - Channels Nix

Dans cet exercice, nous allons comprendre comment fonctionnent les channels Nix.

## Lister les channels courants

Lister les channels déjà installés:
```bash
nix-channel --list
```

Que remarque-t-on ? Pourquoi ?



## Ajouter un nouveau channel


Nous allons maintenant ajouter deux nouveaux channels
```bash
nix-channel --add https://nixos.org/channels/nixos-22.05 nixos
nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs-unstable
nix-channel --update
```

Lister à nouveau les channels pour voir la différence


## Recherche de paquet

Nous pouvons maintenant chercher des paquets dans des channels spécifiques.

Chercher les versions disponibles du paquet Terraform dans deux channels différents.
```bash
nix-env -qaP terraform
nixos.terraform_0_13        terraform-0.13.7
nixos.terraform_0_14        terraform-0.14.11
nixos.terraform_0_15        terraform-0.15.5
nixos.terraform             terraform-1.2.3
nixpkgs.terraform           terraform-1.3.1
nixpkgs-unstable.terraform  terraform-1.3.1
```


Que pouvons nous noter ?

> En fonction du channel, les versions d'un même paquet peuvent varier.
> Le paquet peut porter le même nom mais son contenu peut-être totalement diffénret.