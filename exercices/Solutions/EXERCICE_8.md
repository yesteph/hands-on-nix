# Exercice 8 - Nix build

Dans cet exercice, nous allons explorer les fonctionnalités de build offertes par Nix.
Pour cela, nous effectuerons un build d'une application Python, d'une application Go et d'une image docker.


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


## Build Go

Cette fois ci, nous allons construire une application en Go en utilisant la fonction `fetchFromGithub` qui permet de récupérer des sources directement depuis Github.

Inspecter le fichier de build pour l'application http-server dans le dossier associé et interpréter les différents champs.

Lancer le build de l'application
```bash
cd http-server

nix-build
```

La commande échoue. Pourquoi ?

> La commande échoue car Nix à besoin du hash SHA256 du code source pour valider son contenu.

Régler le problème et relancer le build.

> Remplir le champ sha256 avec la valeur de la sortie de la commande
> Le problème survient à nouveau mais pour les gomodules. Remplir cette fois-ci le champ vendorSha256.

Une fois le build réussi, lancer l'application à partir du binaire créé et vérifier son bon fonctionnement.


## Build Docker

Nous allons maintenant construire une image de l'application http-server au format OCI

Observer le ficher `http-server/docker.nix` et décrire les actions effectuées par Nix pendant ce build.

Lancer le build Docker de l'application:
```bash
nix-build docker.nix
````

Analyser la structure de l'image et l'artifact produit par le build.
```bash
mkdir /tmp/http-server

tar xvf /nix/store/4nl65r71x29qbcc3vgbnjfrq6m54mydx-http-server.tar.gz -C /tmp/http-server

ls /tmp/http-server
```

Tester son bon fonctionnement en utilisant Podman et en lançant un conteneur à partir de cette image.
```bash
# Installer Podman
sudo -i
apt update
apt install podman

# Charger l'image docker
podman load -i /nix/store/4nl65r71x29qbcc3vgbnjfrq6m54mydx-http-server.tar.gz

# Lister les images
podman image ls

# Lancer un conteneur
podman run -dt -p 8081:8081 localhost/http-server:0.1.0

# Tester l'application
curl http://localhost:8081
```