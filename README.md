# Getting started

Set this enviroment variable: 

```pwsh
$env:PATH_REPOS="path/to/.csvfile"
```


```bash
export PATH_REPOS="path/to/.csvfile"
```


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

## Powershell set-repo cli 

Add this [code](./powershell/repos.ps1) to your $PROFILE

The powershell cli should have more validations and error handling but it is not rust

## Bash set-repo cli 

Include the files in the directory `bash` in your ~/.bashrc



