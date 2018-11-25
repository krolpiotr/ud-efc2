#!/bin/bash

# refresh.sh

# ------------------------------------------------------------------------ 
# desc: update, upgrade and autoclean of system
# 
# author : Piotr Krol, simonphoenix.px@gmail.com
# website: simon-phoenix.se
# ------------------------------------------------------------------------

sudo apt-get update && sudo apt-get upgrade
sudo apt-get autoclean
echo ""
service cron restart
echo "done."
