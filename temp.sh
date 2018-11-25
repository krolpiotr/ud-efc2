#!/bin/bash

# run.sh
#
# Starting to do everything on Ubuntu 18.10

# ------------------------------------------------------------------------
# name: start() 
# desc: Makes everything
# return: 0
# author : Piotr Krol, simonphoenix.px@gmail.com
# website: simon-phoenix.se
# ------------------------------------------------------------------------
source config.sh
source functions.sh
# ------------------------------------------------------------------------



#create_directory "${MY_APPLICATIONS[@]}"

# ------------------------------------------------------------------------
create_directory44() { 
  for dir in "$@"; do 
    if [ -d "$dir" ]; 
      then 
        echo "${dir##*/} - destination exist....";
        break;
    else echo "Not exist: ${dir##*/} ... Creating ..."; 
      mkdir -p "$dir"; 
    fi; 
  done; 
  return 0;
}
# ------------------------------------------------------------------------


echo ""
#create_directory44 "${MY_APPLICATIONS[@]}"
#create_directory44 "${MY_PROJECTS[@]}"
#create_directory44 "${MY_SYSTEM[@]}"
#create_directory44 "${MY_SERVER[@]}"
echo ""
echo "$MY_HOME"

rsync -arv --exclude={.ccache,software.sh} "/home/phoenix/efc/scripts" "/home/phoenix/Recycle/pipa"
# utworzyc plik ktory przerzuca wszystko do github folderu
# git clone https://github.com/libgit2/libgit2
#-------------------------------------------------------------------
  args=("$@")
  echo "${args[0]}"
  echo "${args[1]}"
  echo "fgfg $USERNAME"


echo ${MY_USERNAME[0]}
echo ${MY_USERNAME[1]}
echo $MY_USERNAME[1]
#echo ${#MY_USERNAME[0]}
echo "$MY_USERNAME[1]"

for each in "${MY_USERNAME[@]}"
do
  echo "$each"
done

for each in "${MY_USERNAME[1]}"
do
  echo "$each"
done

echo ${MY_APPLICATIONS[0]}





# ------------------------------------------------------------------------
function start() {
  echo '# -----------------------------------------------------------------------#'
  echo '#          Ubuntu EFC                                                    #'
  echo '# -----------------------------------------------------------------------#'
  echo '           '
  echo "Version of Ubuntu"

  lsb_release -a

  echo '           '
  echo '           Start....'
  echo '           '
  echo '# -----------------------------------------------------------------------#'
  echo '#          Start directory....                                           #'
  echo '# -----------------------------------------------------------------------#'

  create_directory "${MY_APPLICATIONS[@]}"
  create_directory "${MY_BACKUPS[@]}"
  create_directory "${MY_GENERALBACKUP[@]}"
  create_directory "${MY_SERVER[@]}"
  create_directory "${MY_PROJECTS[@]}"
  create_directory "${MY_SYSTEM[@]}"
  create_directory "${MY_SOFTWARE[@]}"
  create_directory "${MY_GITHUB[@]}"
  create_directory "${MY_RECYCLE[@]}"

  echo '# -----------------------------------------------------------------------#'
  echo '#          Directory done.                                               #'
  echo '# -----------------------------------------------------------------------#'
  echo '           '

  DIR="${BASH_SOURCE%/*}"
  if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
  . "$DIR/backups.sh"
  echo '           '
}
# ------------------------------------------------------------------------

start
