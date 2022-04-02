# Exercice 5 - Nix shell avec direnv

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

Une fois ceci fait, vérifier la version courante de Python et sa localisation en se déplaçant dans l'arborescence