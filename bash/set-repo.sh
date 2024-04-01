function repo {
  declare alias=$1
  declare -A repos


  skip_headers=1
  while IFS=, read -r col1 col2
  do
    if ((skip_headers))
    then
      ((skip_headers--))
    else
      echo $col2
      if [ "$alias"=="$col1" ]; then
        cd $col2
        return 
      fi
    fi
  done < $PATH_REPOS

 # Access the value using the key and store it in a variable

}
