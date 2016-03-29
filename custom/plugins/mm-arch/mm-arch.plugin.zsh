function find_os_born_date() {
  local _pacman_file="/var/log/pacman.log"
  if [ -f "$_pacman_file" ]; then
    export OS_BORN_DATE=$(sed -n '1s/^\[\([0-9-]*\).*$/\1/p' $_pacman_file)
  fi
  return $OS_BORN_DATE
}

# Execute the function righ away to set the variable
find_os_born_date

# Update pacman
alias pacup="sudo pacman -Sy"
alias pacoutdated="pacman -Qu"
alias pacclean="sudo pacman -Sc"
