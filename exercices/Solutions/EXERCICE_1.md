# Exercice 1 - Installation de paquets

Dans cet exercice, nous allons installer des paquets qui sont nécessaires au bon fonctionnement de nos applications.

En utilisant les commandes vues précédemment, installer les outils suivants:
- Python3
- Git
- Jq
- Terraform (0.15)

Pour vous aider, vous pouvez rechercher les paquets disponibles par deux biais:
- L'interface de recherche nixos : https://search.nixos.org
- La commande `nix-env -qaP <PACKAGE>`

Une fois les paquets installés, cloner votre fork Github.

Installer les dépendances de l'application bobby à l'aide de l'utilitaire pip.

Lancer l'application bobby avec Python3

## Solution

Rechercher les dérivations disponibles
```bash
nix-env -qaP python3
```

Installer Python 3.9 et pip
```bash
nix-env -iA nixpkgs.python3Full nixpkgs.python39Packages.pip
```

Installer Git
```bash
nix-env -iA nixpkgs.git
```

Installer Jq
```bash
nix-env -iA nixpkgs.jq
```

Installer Terraform
```bash
nix-env -iA nixpkgs.terraform_0_15
```

Il est également possible de tout faire en une seule commande
```bash
nix-env -iA nixpkgs.python39 nixpkgs.python39Packages.pip nixpkgs.git nixpkgs.jq nixpkgs.terraform_0_15
```

Cloner son fork
```bash
git clone https://github.com/<USER>/hands-on-nix.git
```

Installer les dépendances de l'application bobby à l'aide de pip
```bash
cd bobby
pip install -r requirements.txt --user
```

Lancer l'application bobby avec Python3:
```bash
python3 bobby.py
```

Ouvrir une deuxième session SSH et vérifier l'accès à l'application bobby à l'aide de l'outil curl
```bash
curl http://localhost:8080
```