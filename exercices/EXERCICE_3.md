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
Voir la command `nix-env -qaP <PACKAGE> -f '<CHANNEL_NAME>'`

Chercher les versions disponibles du paquet Terraform dans deux channels différents.

Que pouvons nous noter ?