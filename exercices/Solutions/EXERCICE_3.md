# Exercice 3 - Channels Nix

Dans cet exercice, nous allons comprendre comment fonctionnent les channels Nix.

## Lister les channels courants

Lister les channels déjà installés:
```bash
nix-channel --list
```

Que remarque-t-on ? Pourquoi ?



## Ajouter un nouveau channel


Nous allons maintenant ajouter un nouveau channel
```bash
nix-channel --add https://nixos.org/channels/nixos-21.11 nixos
nix-channel --update
```

Lister à nouveau les channels pour voir la différence


## Recherche de paquet

Nous pouvons maintenant chercher des paquets dans des channels spécifiques.

Chercher les versions disponibles du paquet Terraform dans deux channels différents.
```bash
nix-env -f '<nixos>' -qaP 'terraform*'
terraform_0_12   terraform-0.12.31
terraform_0_13   terraform-0.13.7
terraform_0_14   terraform-0.14.11
terraform_0_15   terraform-0.15.5
terraform        terraform-1.0.11
terraform_1_0_0  terraform-1.0.11

nix-env -f '<nixpkgs>' -qaP 'terraform*'
terraform_0_13  terraform-0.13.7
terraform_0_14  terraform-0.14.11
terraform_0_15  terraform-0.15.5
terraform       terraform-1.1.7
```


Que pouvons nous noter ?

> En fonction du channel, les versions d'un même paquet peuvent varier.
> Le paquet peut porter le même nom mais son contenu peut-être totalement diffénret.