#!/bin/bash

# fix.locale.sh
#
# version 1.0.0
#
# Fixing $locale on Ubuntu Server 18.10
# author: Piotr Krol, simonphoenix.px@gmail.com

# ------------------------------------------------------------------------
# name: fix_locale() 
# desc: Fixing $locale on Ubuntu Server 18.10
# return: 0
# ------------------------------------------------------------------------
fix_locale() {
    locale
    sudo locale-gen "en_US.UTF-8"
    sudo dpkg-reconfigure locales
}
# ------------------------------------------------------------------------

echo '# -----------------------------------------------------------------------#'
echo '#          Fix locale                                                    #'
echo '# -----------------------------------------------------------------------#'

fix_locale

echo '# -----------------------------------------------------------------------#'
echo '#          Fix locale      done.                                         #'
echo '# -----------------------------------------------------------------------#'
