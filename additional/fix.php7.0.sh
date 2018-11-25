#!/bin/bash

# fix.php7.0.sh
#
# version 1.0.0
#
# Installing PHP on your Ubuntu Desktop 17.10
# author: Piotr Krol, simonphoenix.px@gmail.com

# ------------------------------------------------------------------------
# name: install_php7_mbstring() 
# desc: Install
# args: 
# return: 0
# ------------------------------------------------------------------------
install_php7_mbstring() {
sudo apt-add-repository ppa:ondrej/php
sudo apt-get update
sudo apt-get install php7.0
php -v
}
# ------------------------------------------------------------------------

echo '# -----------------------------------------------------------------------#'
echo '#          Installing PHP 7.0                                            #'
echo '# -----------------------------------------------------------------------#'

install_php7_mbstring

echo '#          Installing PHP 7 mbstring done.                               #'

echo '# -----------------------------------------------------------------------#'
echo '#          Installing PHP 7.0 done.                                      #'
echo '# -----------------------------------------------------------------------#'
