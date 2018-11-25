#!/bin/bash

# fix.java.sh
#
# version 1.0.0
#
# Installing JAVA on your Ubuntu Desktop 17.10
# author: Piotr Krol, simonphoenix.px@gmail.com

# ------------------------------------------------------------------------
# name: install_java() 
# desc: Install
# args: 
# return: 0
# ------------------------------------------------------------------------
install_java() {
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt install oracle-java9-installer
sudo apt install oracle-java9-set-default
javac -version
}
# ------------------------------------------------------------------------

echo '# -----------------------------------------------------------------------#'
echo '#          Installing Java                                               #'
echo '# -----------------------------------------------------------------------#'


install_java


echo '# -----------------------------------------------------------------------#'
echo '#          Installing Java done.                                         #'
echo '# -----------------------------------------------------------------------#'
