# Exercice 9 - Cachix

Dans cet exercice, nous allons découvrir Cachix, une plateforme de cache de binaire.


## Setup

Tout d'abord, il est nécessaire de créer votre propre cache de binaire. Pour cela
- Se rendre sur https://app.cachix.org/
- Créer un compte
- Créer un nouveau cache de binaire (attention le nom doit être unique)
- Créer un token d'authentification
  - Aller dans **Settings** => **Auth Tokens**
  - Renseigner une description
  - Spécifier les droits en écriture


## Utiliser Cachix

Pour pouvoir utiliser Cachix, il faut installer la CLI associée
```bash
nix-env -iA cachix -f https://cachix.org/api/v1/install
```

Ensuite, il faut la configurer pour utiliser votre cache
```bash
# Configurer le cache
cachix use <MON_CACHE>

# Renseigner le token d'accès généré précédemment
cachix authtoken <MON_TOKEN>
```

Lancer un nouveau build de l'application http-server et pousser le binaire dans votre cache
```bash
cd http-server

nix-build | cachix push <MON_CACHE>
```

Se rendre sur l'interface Cachix et inspecter le contenu de votre cache.

On constate plusieurs éléments. Quels sont-ils ?

> Il y a deux binaires. Un contenant le code source de la dérivation et un contenant les dépendances (go modules). Ceci est fait dans un but de réutiliser les dépendances d'un build à l'autre si elles ne changent pas.