# Exercice 10 - Cachix dans un pipeline de CI

Dans cet exercice, nous allons aller plus loin avec Cachix en l'intégrant dans un pipeline de CI Github.


## Setup

Pour que cela fonctionne, il est nécessaire de créer deux secrets au niveau de votre dépôt:
- **CACHIX_AUTH_TOKEN**: Token d'authentification à votre cache de binaire. La valeur correspond à celui que vous avez généré dans l'exercice précédent.
- **CACHIX_SIGNING_KEY**: Clé utilisée pour vérifier l'identité de la personne poussant des binaires dans le cache. Vous pouvez la retrouver soit sur l'interface cachix soit dans le fichier `/home/admin/.config/nix/nix.conf`

## Créer le pipeline

Dans le dossier `.github/workflows`, créer un fichier `build-and-push.yml` avec le contenu suivant (n'oubliez pas de spécifier le nom de votre cache)
```bash
name: "Build and push http-server to cache"
on:
  push:
jobs:
  build-and-push:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2.4.0
    - uses: cachix/install-nix-action@v16
      with:
        nix_path: nixpkgs=channel:nixos-unstable
    - uses: cachix/cachix-action@v10
      with:
        name: <MON_CACHE>
        signingKey: '${{ secrets.CACHIX_SIGNING_KEY }}'
        authToken: '${{ secrets.CACHIX_AUTH_TOKEN }}'
    - run: nix-build http-server
    - run: nix-shell http-server --run "echo HTTP Server successfully built and pushed to cache !"
```

Commit ce fichier et pousser le sur la branche main. Votre pipeline Github Action devrait se lancer.

Observer son déroulement et analyzer les actions effectuées. Notez également le temps complet d'exécution du pipeline.

Relancer le pipeline une nouvelle fois et notez à nouveau le temps d'exécution.

Que remarquez-vous ?