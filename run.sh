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
  . "$DIR/scripts/refresh.sh"
  echo ' '
  . "$DIR/scripts/software.sh"
  echo ' '
  . "$DIR/backups.sh"
  echo '           '
  echo '           Done. Enjoy!'
  echo '           '
}
# ------------------------------------------------------------------------

start
