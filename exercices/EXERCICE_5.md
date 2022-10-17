# Exercice 5 - Nix build

Dans cet exercice, nous allons explorer les fonctionnalités de build offertes par Nix.
Pour cela, nous effectuerons un build d'une application Go et d'une image docker.

## Build Go

Cette fois ci, nous allons construire une application en Go en utilisant la fonction `fetchFromGithub` qui permet de récupérer des sources directement depuis Github.

Inspecter le fichier de build pour l'application http-server dans le dossier associé et interpréter les différents champs.

Lancer le build de l'application
```bash
cd http-server

nix-build
```

La commande échoue. Pourquoi ?

Régler le problème et relancer le build.

Une fois le build réussi, lancer l'application à partir du binaire créé et vérifier son bon fonctionnement.


## Build Docker

Nous allons maintenant construire une image de l'application http-server au format OCI

Observer le ficher `http-server/docker.nix` et décrire les actions effectuées par Nix pendant ce build.

Lancer le build Docker de l'application:
```bash
nix-build docker.nix
```

Analyser la structure de l'image et l'artifact produit par le build.

Installer Podman
```bash
# Installer Podman
sudo -i
apt update
apt install podman
```

Tester son bon fonctionnement en utilisant Podman et en lançant un conteneur à partir de cette image.
