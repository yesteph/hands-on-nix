# Les dépendances de git:

nix-store -q --references `which git`

# Ce dont GIT est une dépendance:

nix-store -q --referrers `which git`

-> environments (profiles nix-env)

- manifests

# Statut des packages

nix-env -qaPs

- I: installed in the user environment
- P: present on the system
- S: a binary is available in the network cache (cachix.org)

# Closure

La closure d'une dérivation est la liste de toutes les dépendances recursives pour utiliser une dérivation.
Copier cette liste permet de déployer la dérivation.

`nix-store -qR `which jq``

`nix-store -q --tree `which jq``