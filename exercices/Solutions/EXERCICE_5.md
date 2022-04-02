# Exercice 4 - Nix shell avec direnv

Dans cet exercice, nous allons voir comment coupler le Nix shell avec l'outil direnv pour faciliter le switch de projet à projet.

## Bobby

Installer direnv
```bash
nix-env -iA nixpkgs.direnv
```

Configurer nix avec direnv pour Bobby
```bash
echo “use_nix” >> bobby/.envrc

eval "$(direnv hook bash)"

cd bobby && direnv allow
```

## Charlie

Faites maintenant le même exercice pour l'application `charlie`.

```bash
echo “use_nix” >> charlie/.envrc

cd charlie && direnv allow
```

Une fois ceci fait, vérifier la version courante de Python et sa localisation en se déplaçant dans l'arborescence

```bash
# In charlie directory
python --version # Python 3
which python

cd ../bobby
python --version # Python 2
which python

cd
python --version # Python 3 (système)
which python
```