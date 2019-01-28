#!/bin/bash

# software.sh
#
# Package autoinstallation file

# ------------------------------------------------------------------------
# name: install_freeware() 
# desc: check if packages have been installed, if not installs
# return: 0
# author : Piotr Krol, simonphoenix.px@gmail.com
# website: simon-phoenix.se
# ------------------------------------------------------------------------
function install_freeware() {  

# tutorial
#    if dpkg-query -W irssi > /dev/null  2>&1 ; then
#      echo "irssi :: installed"; 
#    else 
#      echo "irssi :: not installed"
#      echo "installing ...."
#      sudo apt-get install irssi;
#    fi
  echo '# -----------------------------------------------------------------------#'
  echo '#          Checking packages....                                         #'
  echo '# -----------------------------------------------------------------------#'
    # list of packages
    list[0]=apache2
    list[1]=proftpd
    list[2]=mysql-server
    list[3]=php-mysql
    list[4]=phpmyadmin
    list[5]=php

    # http://www.geoffstratton.com/ubuntu-mail-server-postfix-dovecot-and-mysql
    list[6]=postfix
    list[7]=postfix-mysql
    list[8]=dovecot-core
    list[9]=dovecot-imapd
    list[10]=dovecot-lmtpd
    list[11]=dovecot-mysql
    list[12]=zip
    list[13]=telnet
    list[14]=mailutils
    # echo "Message Body" | mail -s "Message Subject" receiver@example.com

    list[15]=dovecot-common
    list[16]=dovecot-imapd
    list[17]=dovecot-pop3d
    list[18]=dovecot-lmtpd

    # to fix mbstring on Ubuntu 16.04
    list[19]=php-mbstring
    list[20]=php7.0-mbstring
    list[21]=php-gettext
    # service apache2 restart

    list[22]=nano
    list[23]=default-jre
    list[24]=net-tools
    list[25]=git
    list[26]=php7.0-intl
    list[27]=hexchat

    list[28]=nfs-common
    list[29]=gparted

    list[30]=xchat
    list[31]=gnome-shell
    list[32]=ubuntu-gnome-desktop

    # to fix mbstring on Ubuntu 17.10
    list[33]=php-intl
    list[34]=php7.1-mbstring
    list[35]=php7.1-intl
    list[36]=gnumeric

    list[37]=python3
    list[38]=python3-pymysql
    
    list[39]=spyder3
    list[40]=libmysqlclient-dev
    list[41]=python3-mysqldb
    
    list[42]=rar
    list[43]=vokoscreen
    list[44]=ffmpeg
    list[45]=mencoder
    list[46]=kdenlive # movie creator
    list[47]=meld
    list[48]=kompare
    list[49]=composer
    list[50]=curl
    list[51]=python3-django
    list[52]=python3-pip
    list[53]=amule
    list[54]=gettext
    list[55]=code


    # if such a file does not exist there then you have to make a link
    #cd /usr/lib/postfix
    #ln -s postfix-mysql.so.1.0.1 dict_mysql.so

    #sudo apt-cache search

    for kls in ${list[*]}; do

      if dpkg-query -W $kls > /dev/null  2>&1 ; then
        echo "${kls} :: installed"; 
      else 
        echo "${kls} :: not installed"
        echo "installing ...."
        sudo apt-get install $kls;
      fi

    done

  echo '# -----------------------------------------------------------------------#'
  echo '#          Package checking completed.                                   #'
  echo '# -----------------------------------------------------------------------#'

    return 0
}
# ------------------------------------------------------------------------

  install_freeware
  
# ------------------------------------------------------------------------
