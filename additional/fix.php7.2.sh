#!/bin/bash

# fix.php7.2.sh
#
# version 1.0.0
#
# Installing PHP on your Ubuntu Desktop 18.10
# author: Piotr Krol, simonphoenix.px@gmail.com

# ------------------------------------------------------------------------
# name: install_php7_mbstring() 
# desc: Install
# args: 
# return: 0
# ------------------------------------------------------------------------
install_php7_mbstring() {
sudo apt-get install python-software-properties
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt-get install -y php7.2
php -v
}
# ------------------------------------------------------------------------

echo '# -----------------------------------------------------------------------#'
echo '#          Installing PHP 7.2                                            #'
echo '# -----------------------------------------------------------------------#'


install_php7_mbstring

echo '#          Installing PHP 7.2 mbstring done.                             #'

echo '# -----------------------------------------------------------------------#'
echo '#          Installing PHP 7.2 done.                                      #'
echo '# -----------------------------------------------------------------------#'
