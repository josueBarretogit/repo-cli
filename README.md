# Getting started

you will need a .csv file containing your repos with this format:

"alias", "path"
"repo" , "~/path/repo"


## Rust-cli

Build the proyect and set the executable to your path

```bash

cargo run --release


```

## Usign rust add-repos cli

Add a new repository to the .csv file containing your repos 

```bash

    add-repos -a golang -p ~\desktop\golang-proyect

```

the .csv file should look like this: 

"alias", "path"
"golang" , "C:\User\user\desktop\golang-proyect"

## Powershell 

Add this [code](./powershell/repos.ps1) to your $PROFILE


