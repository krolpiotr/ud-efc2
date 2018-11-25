#!/bin/bash

# config.sh
#
# Config file

# ------------------------------------------------------------------------
USERNAME="phoenix"
MY_USERNAME=("$USERNAME" "Username")
DEVELOPMENT="/Recycle"    # default: "" use example: "/Recycle"
# ------------------------------------------------------------------------
MY_HOME=("/home/$USERNAME" "Home")
MY_APPLICATIONS=("/home/$USERNAME$DEVELOPMENT/Applications" "Applications")
MY_BACKUPS=("/home/$USERNAME$DEVELOPMENT/Backups" "Backups")
MY_GENERALBACKUP=("/home/$USERNAME$DEVELOPMENT/General" "General")
MY_SERVER=("/home/$USERNAME$DEVELOPMENT/Server" "Server")
MY_PROJECTS=("/home/$USERNAME$DEVELOPMENT/Projects" "Projects")
MY_SYSTEM=("/home/$USERNAME$DEVELOPMENT/System" "System")
MY_SOFTWARE=("/home/$USERNAME$DEVELOPMENT/Software" "Software")
MY_GITHUB=("/home/$USERNAME$DEVELOPMENT/GitHub" "GitHub")
MY_RECYCLE=("/home/$USERNAME$DEVELOPMENT/Recycle" "Recycle")

# MySQL config
MYSQL_HOST=localhost
MYSQL_PORT=3306
MYSQL_USER=root
MYSQL_PASSWORD="secret"
# ------------------------------------------------------------------------

