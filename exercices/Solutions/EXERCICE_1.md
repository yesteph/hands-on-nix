# Exercice 1 - Installation de paquets

Dans cet exercice, nous allons installer des paquets qui sont nécessaires au bon fonctionnement de nos applications.

En utilisant les commandes vues précédemment, installer les outils suivants:
- Python3
- Git
- Jq
- Terraform (1.1.7)

Pour vous aider, vous pouvez rechercher les paquets disponibles par deux biais:
- L'interface de recherche nixos : https://search.nixos.org
- La commande `nix-env -qaP <PACKAGE>`

Une fois les paquets installés, cloner votre fork Github.

Installer les dépendances de l'application charlie à l'aide de l'utilitaire pip.

Lancer l'application charlie avec Python3

## Solution

Rechercher les dérivations disponibles
```bash
nix-env -qaP python3
```

Installer Python 3.10 et pip
```bash
nix-env -iA nixpkgs.python310 nixpkgs.python310Packages.pip
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
nix-env -iA nixpkgs.terraform
```

Il est également possible de tout faire en une seule commande
```bash
nix-env -iA nixpkgs.python310 nixpkgs.python310Packages.pip nixpkgs.git nixpkgs.jq nixpkgs.terraform
```

Cloner son fork
```bash
git clone https://github.com/<USER>/hands-on-nix.git
```

Installer les dépendances de l'application charlie à l'aide de pip
```bash
cd charlie
pip install -r requirements.txt
```

Lancer l'application Charlie avec Python3:
```bash
python3 charlie.py
```

Ouvrir une deuxième session SSH et vérifier l'accès à l'application charlie à l'aide de l'outil curl
```bash
curl http://localhost:9090
```