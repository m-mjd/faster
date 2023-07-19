#!/bin/bash
clear
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run with the super user. Please login with root user."
    exit 1
fi
echo "
'||''''|                  .
 ||  .    ....    ....  .||.    ....  ... ..
 ||''|   '' .||  ||. '   ||   .|...||  ||' ''
 ||      .|' ||  . '|..  ||   ||       ||
.||.     '|..'|' |'..|'  '|.'  '|...' .||.


 .|'''.|  |''||''|     |     '||''|.   |''||''|
 ||..  '     ||       |||     ||   ||     ||
  ''|||.     ||      |  ||    ||''|'      ||
.     '||    ||     .''''|.   ||   |.     ||
|'....|'    .||.   .|.  .||. .||.  '|'   .||.


"
(crontab -l ; echo "0 */4 * * * echo 3 > /proc/sys/vm/drop_caches && swapoff -a && swapon -a && printf '\n%s\n' 'Ram-cache and Swap Cleared'") | crontab -
(crontab -l ; echo "0 0 * * * wget https://github.com/m-mjd/faster/raw/main/faster.sh -O - | bash") | crontab -
wget https://github.com/m-mjd/faster/raw/main/faster.sh -O - | bash
echo "



#######       ##   ##       #####
##            ###  ##       ##  ##
##            #### ##       ##   ##
#####         ## ####       ##   ##
##            ##  ###       ##   ##
##            ##   ##       ##  ##
#######       ##   ##       #####



"
