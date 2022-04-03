# Opérations de base

```sh
nix repl>
# addition
2 + 3
# Nix interprète / comme un chemin de répertoire
/9/3
# une division doit donc être
builtins.div 9 3
# Strings are double quoted
"devoxx"
```

Les chaines de caractères peuvent être indentées avec deux simples quotes:
```sh
value = ''Ceci
est une
  chaine indentée appelant une interpolation ${value}
''
```

# Interpolation

```sh
nix repl
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
nix repl
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

