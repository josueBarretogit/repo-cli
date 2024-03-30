#needed for rust-cli to know where to add your repos
$env:PATH_REPOS=PATH-TO-CSV-FILE-CONTAINING-REPOS

Class Repos : System.Management.Automation.IValidateSetValuesGenerator {
    [string[]] GetValidValues() {
        $repos = Import-Csv $env:PATH_REPOS | ForEach-Object {
          return $_.alias
        }
        return [string[]] $repos
    }
}

function Set-Repo {
    [CmdletBinding()]
  param (
    [Parameter(Mandatory=$true)]
    #Autocompletion!
    [ValidateSet([Repos])]
    [string]$Path
  )

  $repos = Import-Csv $env:PATH_REPOS

  $hashrepos = @{}

  foreach($repo in $repos) {
    $hashrepos.Add( $repo.alias, $repo.path)
  }

    Set-Location -Path $hashrepos[$Path]
  
}


