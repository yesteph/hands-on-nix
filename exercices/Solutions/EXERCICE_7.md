# Exercice 7 - Syntaxe Nix

Dans cet exercice nous allons nous familiariser avec la syntaxe des expression Nix.

Nous utilisons principalement la commande `nix repl`
## Opérations de base

```sh
nix repl>
# addition
2 + 3
# Nix interprète "/" comme un chemin de répertoire
/9/3
#  une division doit donc être
builtins.div 9 3
# Les chaines de caractères sont souvent double quotées
jaime = "devoxx"
```

Les chaines de caractères peuvent être indentées avec deux simples quotes.

# Interpolation

L'opérateur `${}` permet les interpolations:

```sh
nix repl>
event = "Hands-on"
msg = "Happy ${event}!"
msg
```

# Listes

```sh
nix repl
myList = [1 2 3 99 "something"]
myList
```

# Attribute sets

Les expressions Nix utilisent massivement les attribute sets.

```sh
nix repl
msg = { event = "Hands-on"; a-b = "baz"; "123" = "an int key"; }
# Selection d'attribut pointée .
msg.event
msg.a-b
msg."123"
# Les attribute sets peuvent être récursifs!!
rec { category = "Hands-on"; conference = "Devoxx"; msg = "Welcome to ${category} ${conference}";}    
```

# Let 

Une expression let permet de définir un certain nombre de variables locales puis d'évaluer les variables:
```sh
nix repl>
let a = 4; b = a + 5; in b
```

# With

Permet d'inclure un attribute set dans le scope courant.
```sh
mySet = { conference = "Devoxx";  title = "Nix Hands-on"; }
with mySet; conference + title
```

# Lazy

Seules les expressions necessaires sont évaluées:
```sh
nix repl
# Pas d'erreur avec la division par 0, car pas évaluée
let a = builtins.div 4 0; b = 6; in b
```

# Functions


Les fonctions Nix ne supportent qu'un seul paramètre.

```sh
nix repl>
# Les fonctions Nix sont anonymes
x: x*3
# On les affecte donc à des variables
byThree = x: x*3
# En les appelant avec des arguments espacés
byThree 4
```

Pour plusieurs paramètres, la syntaxe s'inspire des programmations fonctionnelles:
```sh
nix repl>
add = a: (b: a+b)
# Retourne une nouvelle fonction anonyme faisant "b: 3+b"
add 3
# Elle peut être appelée avec parenthèses
(add 3) 4
# Ou sans
add 3 4 
# Des applications partielles peuvent donc être faites
offset4 = add 4
offset4 5
offset4 (10+5)
```

Une fonction peut aussi utiliser un `attribute set` en paramètre pour réaliser du pattern matching.
L'intéret est de ne plus se soucier de l'ordre des paramètres et travailler sur des sets de données.

```sh
nix repl>
add = {a, b}: a+b
add {b=5; a=3;}
# Avec des valeurs par défaut en utilisant l'opérateur "?"
add = {a, b ? 10}: a+b
add {a=5;}
# L'opérateur "...' (variadic) permet de passer un nombre d'arguments infini.
add = {a, b ? 10, ...}: a+b
add {a=3;b=4;attributInutile=12;}
```

# import

La fonction `import` permet de composer différents fichiers Nix (ensemble de fonctions, sets, ...):
```sh
cat <<EOF>> file1.nix 
{ valueA = 12; valueb = 5; mul = a: a*2;}
EOF
```
```sh
nix repl>
fileContent = import ./file1.nix
builtins.trace "Content of file1 is:" fileContent
```

# Builtins 

Les fonctions de base de l'évaluateur d'expressions Nix sont dans [`builtins`](https://nixos.org/manual/nix/stable/expressions/builtins.html).
Notez les fonctions `fetchUrl`, `fetchGit` et `derivation`... nous en parlons juste après.

# Derivation

Une dérivation est une description de construction d'un paquet.
Nix propose une fonction [`derivation`](https://nixos.org/manual/nix/stable/expressions/derivations.html) pour construire un paquet unitaire. Cette fonction prend en paramètre un `set` devant contenir les attributs suivants:
* `system`: indiquant le type de système pour lequel la derivation est valable. Typiquement `x86_64-linux` ou `x86_64-darwin`. 
* `name`: pour les liens symboliques `nix-env`
* `builder`: le programme à appeler pour construire le paquet. Il peut s'agir d'un script `./builder.sh` ou d'une autre dérivation. 

```sh
nix repl>
# Appelons la fonction Nix qui permet de créer une dérivation
derivation { name = "myFirstDerivation"; builder = "mybuilder"; system = "mysystem"; }
```

Cette fonction retourne un chemin du store Nix (`XXX.drv`).
Inspectons son contenu: `nix show-derivation /nix/store/14fkbisp4km9b0q5rfvr6kgiy024r7sn-myFirstDerivation.drv»`

Nous retrouvons les attributs passés. D'autres sont vides, en particulier `args` qui indique les arguments passés au builder et `inputs` qui indique les dépendances requises pour construire notre application.

Plus intéressant, le chemin `out` est indiqué. Existe-t-il ? 
Non, car nous avons seulement défini une dérivation à partir d'une expression Nix.
Par contre, ce chemin `out` contient un hash pré-déterminé en fonction de la définition de notre dérivation.
Tout modification de notre derivation comme une nouvel argument, une nouvelle dépendance donne lieu à un nouveau chemin.

Nous pouvons ajouter une référence à une autre dérivation. Prenons `coreutils`, founi par `nixpkgs`, qui fournit les appels systèmes Linux de base.
```sh
nix repl>
# Import des paquets nixpkgs pour les utiliser dans notre derivation
# L'attribute set retourne 16 000 entrées, dont coreutils
:l <nixpkgs>
# Usage de la commande "touch" depuis le paquet "coreutils"
d = derivation { name = "myname"; builder = "${coreutils}/bin/true"; system = builtins.currentSystem; }
```

Cela donne un nouveau fichier de derivation, pointant sur la dérivation coreutils résolue en local à l'instant T.
Le chemin `out` a lui aussi un nouveau Hash.

Nous nous arretons là pour le moment concernant les derivations.