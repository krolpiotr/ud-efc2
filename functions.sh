#!/bin/bash

# functions.sh
#
# Functions

# ------------------------------------------------------------------------
# name: create_directory()
# desc: Check folders
# author: Piotr Krol, simonphoenix.px@gmail.com
# ------------------------------------------------------------------------
create_directory() {
  args=("$@")
  if [ -d "${args[0]}" ]; then
    echo "           ${args[1]} destination exist...."
    echo ""
  else
    echo "           ${args[1]} destination not exist...."
    echo "           Creating ${args[1]} here...."
    echo "           ${args[0]}"
    echo ""
    mkdir -p "${args[0]}"
    sudo chmod 755 "${args[0]}"
    sudo chown "$USERNAME":"$USERNAME" "${args[0]}"
  fi
}
# ------------------------------------------------------------------------
# name: cleaning() 
# desc: Cleaning old back up files
# return: 0
# ------------------------------------------------------------------------
function cleaning() {  
  echo '           Cleaning....'
  echo ''
  dird="$1"
  days=0
  echo -n "           removing files in $dird that are older than $days days: "
  find "$dird" -mtime +$days -type f -exec echo {} \; -exec rm {} \; | wc -l
}
# ------------------------------------------------------------------------
# name: backup_directory() 
# desc: Back up directory
# args: name of directory,source directory,destination directory
# return: 0
# ------------------------------------------------------------------------
  function backup_directory() {  

    PROJECT=$1
    SOURCE=$2
    DESTINATION=$3

    #$PROJECT="$PROJECT"
    BACKUPFILE=$PROJECT-`date +%Y-%m-%d`.tar.gz


    if [ ! -d "$SOURCE/"$PROJECT ]; then
       # Control will enter here if "$WEBDIR/$PROJECT/sql" doesn't exist.
       echo "           Directory of your $PROJECT doesn't exist in"
       echo "           $SOURCE"
       echo "           Check configuration."
       return 0
    fi

    if [ ! -d "$DESTINATION" ]; then
       # Control will enter here if "$WEBDIR/$PROJECT/sql" doesn't exist.
       echo "           Directory of your backup"
       echo "           $DESTINATION"
       echo "           doesn't exist."
       echo "           Check configuration."
       return 0
    fi


    echo "           Backup $PROJECT directory...."

    cd "$DESTINATION"

    if [ -e "$DESTINATION/"$BACKUPFILE ]
      then
      # we did backup today
      echo "           Backup of $BACKUPFILE - done"
    else
      # we will make a backup
      echo "           Backup of $PROJECT - not done... creating backup..."
      cp -rf "$SOURCE/"$PROJECT "$DESTINATION/../tmp/"$PROJECT
      cd "$DESTINATION/../tmp"
      #zip -r $OF "$DOVECOTCONF"
      tar czfP "$BACKUPFILE" "$PROJECT"

      cp -rf "$DESTINATION/../tmp/"$BACKUPFILE "$DESTINATION/"$BACKUPFILE
      # usuwanie folderu apache2 z tmp
      rm -rf "$DESTINATION/../tmp/"$PROJECT
      rm -rf "$DESTINATION/../tmp/"$BACKUPFILE
    fi

    echo "           Backup $PROJECT directory done."

    return 0
  }
# ------------------------------------------------------------------------
# name: backup_file() 
# desc: Back up file
# args: name of file,source directory,destination directory
# return: 0
# ------------------------------------------------------------------------
  function backup_file() {  

    PROJECT=$1
    SOURCE=$2
    DESTINATION=$3

    #$PROJECT="$PROJECT"
    BACKUPFILE=$PROJECT-`date +%Y-%m-%d`.tar.gz


    if [ ! -f "$SOURCE/$PROJECT" ]; then
       # Control will enter here if "$WEBDIR/$PROJECT/sql" doesn't exist.
       echo "           File of your $PROJECT doesn't exist in"
       echo "           $SOURCE"
       echo "           Check configuration."
       return 0
    fi

    if [ ! -d "$DESTINATION" ]; then
       # Control will enter here if "$WEBDIR/$PROJECT/sql" doesn't exist.
       echo "           Directory of your backup"
       echo "           $DESTINATION"
       echo "           doesn't exist."
       echo "           Check configuration."
       return 0
    fi


    echo "           Backup $PROJECT file...."

    cd "$DESTINATION"

    if [ -e "$DESTINATION/"$BACKUPFILE ]
      then
      # we did backup today
      echo "           Backup of $BACKUPFILE - done"
    else
      # we will make a backup
      echo "           Backup of $PROJECT - not done... creating backup..."
      cp -r "$SOURCE/"$PROJECT "$DESTINATION/../tmp/"$PROJECT
      cd "$DESTINATION/../tmp"
      #zip -r $OF "$DOVECOTCONF"
      tar czfP "$BACKUPFILE" "$PROJECT"

      cp -r "$DESTINATION/../tmp/"$BACKUPFILE "$DESTINATION/"$BACKUPFILE
      # usuwanie folderu apache2 z tmp
      rm -r "$DESTINATION/../tmp/"$PROJECT
      rm -r "$DESTINATION/../tmp/"$BACKUPFILE
    fi

    echo "           Backup $PROJECT file done."

    return 0
  }
# ------------------------------------------------------------------------
# ------------------------------------------------------------------------
# name: general_backup() 
# desc: Backup of Backups to one file
# ------------------------------------------------------------------------
general_backup() {
    BACKUPSDIR=$1
    GENERALBACKUPSDIR=$2

    if [ ! -d "$BACKUPSDIR" ]; then
       # Control will enter here if "$BACKUPSDIR" doesn't exist.
       echo "           Directory of your backups doesn't exist."
       echo "           Check configuration."
       return 0
    fi

    if [ -d "$GENERALBACKUPSDIR" ]; then
      echo '           General backup destination exist....'
    else
      echo '           General backup destination not exist....'
      echo '           Creating "General" here....'
      mkdir -p "$GENERALBACKUPSDIR"
      sudo chmod 755 "$GENERALBACKUPSDIR"
      sudo chown phoenix:phoenix "$GENERALBACKUPSDIR"
    fi
    
    PROJECT="Backups"
    BACKUPFILE=$PROJECT-`date +%Y-%m-%d`.tar.gz

    echo "           General Backup directory...."

    cd "$GENERALBACKUPSDIR"

    if [ -e "$GENERALBACKUPSDIR/"$BACKUPFILE ]
      then
      # we did backup today
      echo "           Backup of $BACKUPFILE - done"
    else
      # we will make a backup
      echo "           Backup of $PROJECT - not done... creating backup..."
      cd "/home/phoenix"
      tar czfP "$GENERALBACKUPSDIR/$BACKUPFILE" "$PROJECT"
      sudo chmod 755 "$GENERALBACKUPSDIR/$BACKUPFILE"
      sudo chown phoenix:phoenix "$GENERALBACKUPSDIR/$BACKUPFILE"
    fi
}
# ------------------------------------------------------------------------
# name: clean_general_backups() 
# desc: Backups older than 3 days are deleted
# ------------------------------------------------------------------------
clean_backups() {
    dird="$GENERALBACKUPSDIR/"
    days=7
    echo -n "           removing files in $BACKUPSDIR that are older than $days days: "
    find "$dird" -mtime +$days -type f -exec echo {} \; -exec rm {} \; | wc -l
}
# ------------------------------------------------------------------------
# ------------------------------------------------------------------------
# name: backup_website() 
# desc: Backup website
# args: project name,mysql database,mysql host,mysql user,mysql password
# return: 0
# ------------------------------------------------------------------------
backup_website() {

    PROJECT=$1
    DATABASE=$2
    DBHOST=$3
    DBUSERNAME=$4
    DBPASSWORD=$5
#echo "${MY_SERVER[0]}"
    WEBDIR="${MY_SERVER[0]}"
    BACKUPSDIR="${MYB_SERVER[0]}"


    if [ ! -d "$WEBDIR" ]; then
       # Control will enter here if "$WEBDIR/$PROJECT/sql" doesn't exist.
       echo "           Directory of your websites doesn't exist."
       echo "           Check configuration."
       return 0
    fi

    if [ ! -d "$BACKUPSDIR" ]; then
       # Control will enter here if "$WEBDIR/$PROJECT/sql" doesn't exist.
       echo "           Directory of your backups doesn't exist."
       echo "           Check configuration."
       return 0
    fi

    if [ -z "$DATABASE" ]
      then
        echo "           Backup of $PROJECT"
    else
        echo "           Backup of $PROJECT and database $DATABASE"
    fi

    if [ ! -d "$WEBDIR/$PROJECT" ]; then
       # Control will enter here if "$WEBDIR/$PROJECT/sql" doesn't exist.
       echo "           Directory of your project doesn't exist."
       echo "           Check configuration."
       return 0
    fi

    # for humans
    OFPX=$PROJECT.zip
    OF=$PROJECT-`date +%Y-%m-%d`.zip
    cd $BACKUPSDIR

    # if project doesn't exist, function don't do anything
    if [ -e $OF ]
      then
        # if backup already exist
        echo "           Backup of $PROJECT - done"
      else
        # backup doesn't exist, we are creating backup then...
        echo "           Backup of $PROJECT - not done... creating backup..."


        # database
        # ----------------------------------------------------------------
        # backup of database must be first
        # if database parameter doesn't exist
          if [ -z "$DATABASE" ]
            then
              echo "           Doesn't exist any database for this project."
          else

              # we will check if database exist and access
              RESULT=`mysql -h$DBHOST -u$DBUSERNAME -p$DBPASSWORD -e "SHOW DATABASES" | grep -Fo $DATABASE`
              if [ "$RESULT" == "$DATABASE" ]; then

                  # we need to check if directory for mysql file exist
                  # if not we gonna create one

                  if [ ! -d "$WEBDIR/$PROJECT/sql" ]; then
                    # Control will enter here if "$WEBDIR/$PROJECT/sql" doesn't exist.
                    mkdir "$WEBDIR/$PROJECT/sql"
                  fi

                  cd "$WEBDIR/$PROJECT/sql"
                  echo "           Database $DATABASE first"
                  rm $DATABASE-dev-*
                  mysqldump -h $DBHOST -u $DBUSERNAME --password=$DBPASSWORD $DATABASE > "$WEBDIR/$PROJECT/sql/$DATABASE-dev-`date +%y-%m-%d`.sql"

              else
                  echo "           Database does not exist. Check configuration."
              fi

          fi
        # ----------------------------------------------------------------


        cd $WEBDIR
        # we are creating zip archive
        zip -r $OF "$PROJECT"
        # we are checking if backup exist
          if [ -e $OF ]
            then
            # if archive exist we must to copy backup file and delete temporary file
            cd $BACKUPSDIR
            # we are copying file and removing temporary
            cp "$WEBDIR/"$OF "$BACKUPSDIR/"$OF
            rm "$WEBDIR/"$OF
          fi
    fi
}
# ------------------------------------------------------------------------
# name: clean_backups() 
# desc: Backups older than 0 days are deleted
# return: 0 ///////////////////////  psuje kompa 
# removing files in  that are older than 0 days: rm: remove write-protected regular file '/swapfile'? 
# ------------------------------------------------------------------------
clean_website_backups() {
    dird="$BACKUPSDIR/"
    days=0
    echo -n "           removing files in $BACKUPSDIR that are older than $days days: "
    find "$dird" -mtime +$days -type f -exec echo {} \; -exec rm {} \; | wc -l
}
# ------------------------------------------------------------------------