# Setup

## Environnement de lab

Pour faire les exercices, vous avez à votre disposition une machine virtuelle qui vous permettra de faire les actions demandées sans altérer votre système d'exploitation.

Pour y accéder, vous devez établir une connexion SSH :
```bash
ssh admin@<IP> # le mot de passe vous est fournit par les speakers
```

## Installer Nix

Installer Nix sur l'ensemble du système:
```bash
sh <(curl -L https://releases.nixos.org/nix/nix-2.9.1/install) --daemon
```

Relancer la session SSH

Vérifier que Nix est bien installé:
```bash
nix --version
```

Consulter la liste des dérivations installées:
```bash
ls -l /nix/store
```

Différents types de fichiers sont présents pour permettre la gestion de paquets par Nix.

Vous trouverez notamment les dossiers `coreutils`, `gcc` et `nixpkgs`.

Regarder leur contenu. Que remarquez vous ?

## Nix-env

Nix-env est un outil permettant de gérer les environnements et les profils Nix. Avec cette commande, il est possible de faire un certain nombre d'actions

Lister les paquets installés:
```bash
nix-env -q
```

Installer la ligne de commande AWS:
```bash
nix-env -i awscli
```

Vérifier l'installation:
```bash
aws --version
```

Inspecter le binaire
```bash
which aws

ls -l /home/admin/.nix-profile/bin

ls /nix/store/r7s2zhyk21hv3pvsc686fqr493kk6a83-awscli-1.22.35/bin
```