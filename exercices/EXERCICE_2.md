# Exercice 2 - Générations et rollback

Dans cet exercice, nous allons expérimenter le système de générations et de rollback.

## Profil courant

Tout d'abord, vérifions l'état de notre profil courant:
```bash
ls -l /home/admin/.nix-profile
# Noter le profil Nix associé au profil courant
```

Suivre les liens symboliques et inspecter le contenu du répertoire associé.

## Installation d'un nouveau paquet

L'installation Python actuelle pointe sur python3:
```bash
python --version
```

Ensuite, faisons une installation de Python 2 dans notre profil courant:
```bash
nix-env -iA nixpkgs.python2

# Vérifier la version de Python
python --version
```

Inspecter à nouveau l'état du profil courant et noter ce qui a changé.

## Effectuer un retour arrière

Finalement, nous avions besoin de Python 3 précédemment installé. Pas de problème, faisons un rollback !
```bash
nix-env --rollback

# Vérifier la version de Python
python --version
```

Regarder une dernière fois le profil courant.


Que remarque-t-on ?