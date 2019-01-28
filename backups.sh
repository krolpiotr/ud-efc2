#!/bin/bash

# backups.sh
#
# Backups file

# ------------------------------------------------------------------------
source config.sh
source functions.sh
# ------------------------------------------------------------------------
function backups() {
  # system backup destinations
  MYB_ETC=("${MY_BACKUPS[0]}/etc" "/Backups/etc")
  MYB_VAR=("${MY_BACKUPS[0]}/var" "/Backups/var")
  MYB_HOME=("${MY_BACKUPS[0]}/home" "/Backups/home")
  MYB_SERVER=("${MY_BACKUPS[0]}/home/Server" "/Backups/Server")
  MYB_PROJECTS=("${MY_BACKUPS[0]}/home/Projects" "/Backups/Projects")
  MYB_TMP=("${MY_BACKUPS[0]}/tmp" "/Backups/tmp")
  # creating temporary backup
  echo '# -----------------------------------------------------------------------#'
  echo '#          System Configuration Backup                                   #'
  echo '# -----------------------------------------------------------------------#'
  create_directory "${MYB_ETC[@]}"
  create_directory "${MYB_VAR[@]}"
  create_directory "${MYB_HOME[@]}"
  create_directory "${MYB_SERVER[@]}"
  create_directory "${MYB_TMP[@]}"
  echo '# -----------------------------------------------------------------------#'
  echo '#          Start system configuration backup...                          #'
  echo '# -----------------------------------------------------------------------#'
  backup_directory "php" "/etc" "${MYB_ETC[0]}"
  echo ''
  backup_directory "apache2" "/etc" "${MYB_ETC[0]}"
  echo ''
  backup_directory "dovecot" "/etc" "${MYB_ETC[0]}"
  echo ''
  backup_directory "postfix" "/etc" "${MYB_ETC[0]}"
  echo ''
  backup_file "hosts" "/etc" "${MYB_ETC[0]}"
  echo ''
  backup_file "crontab" "/etc" "${MYB_ETC[0]}"
  echo ''
  backup_directory "efc" "${MY_HOME[0]}" "${MYB_HOME[0]}"
  echo ''
  backup_directory "System" "${MY_HOME[0]}" "${MYB_HOME[0]}"
  echo ''
  backup_directory "Projects" "${MY_HOME[0]}" "${MYB_HOME[0]}"
  echo ''
  backup_directory "mail" "/var" "${MYB_VAR[0]}"
  echo ''
  cleaning "${MYB_ETC[0]}"
  cleaning "${MYB_VAR[0]}"
  cleaning "${MYB_HOME[0]}"
  echo ''
  echo '# -----------------------------------------------------------------------#'
  echo '#          System configuration backup done.                             #'
  echo '# -----------------------------------------------------------------------#'
  echo ''
  echo '# -----------------------------------------------------------------------#'
  echo '#          Buckup Websites                                               #'
  echo '# -----------------------------------------------------------------------#'

  # you can always change location of this list
  source "${MY_HOME[0]}/efc/websites.sh"

  cleaning "${MYB_SERVER[0]}"
  
  echo ''
  echo '# -----------------------------------------------------------------------#'
  echo '#          Buckup Websites done.                                         #'
  echo '# -----------------------------------------------------------------------#'
  echo ''
  echo '# -----------------------------------------------------------------------#'
  echo '#          General Buckup                                                #'
  echo '# -----------------------------------------------------------------------#'

  general_backup "${MY_BACKUPS[0]}" "${MY_GENERALBACKUP[0]}"

  echo '# -----------------------------------------------------------------------#'
  echo '#          General Buckup done.                                          #'
  echo '# -----------------------------------------------------------------------#'
}
# ------------------------------------------------------------------------

backups
