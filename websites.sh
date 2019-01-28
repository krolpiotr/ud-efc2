#!/bin/bash

# websites.sh
#
# List of websites to backup

# ------------------------------------------------------------------------
# from directory Server
# backup_website "project_name" "databasename" "localhost"  "gandalf" "password"
# backup_website "project_name"

backup_website "somewebsite.eu" "database_name" "localhost"  "root" "your-password"
echo ''
backup_website "someweb.se" "someweb_database" "localhost"  "root" "your-password"
echo ''
# ------------------------------------------------------------------------

