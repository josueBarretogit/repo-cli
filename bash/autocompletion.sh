_setRepoAutocompletion()
{
  FILE="$PATH_REPOS"

#starting while loop to read through a CSV file line by line (delimiter is comma)
    repos=($(tail -n +2 $PATH_REPOS | cut -d',' -f1 | tr -d '"'))

cur=${COMP_WORDS[COMP_CWORD]}

COMPREPLY=( $( compgen -W "${repos[*]}" -- $cur ) )

}

complete -o default -o nospace -F _setRepoAutocompletion  set-repo
