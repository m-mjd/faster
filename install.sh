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

#!/bin/bash

if crontab -l | grep -q "echo 3 > /proc/sys/vm/drop_caches && swapoff -a && swapon -a && printf '\n%s\n' 'Ram-cache and Swap Cleared'"; then
    echo "دستور قبلا به crontab اضافه شده است."
else
    (crontab -l 2>/dev/null; echo "0 0 * * * echo 3 > /proc/sys/vm/drop_caches && swapoff -a && swapon -a && printf '\n%s\n' 'Ram-cache and Swap Cleared'") | crontab -
    echo "دستور با موفقیت به crontab اضافه شد."
fi

if crontab -l | grep -q "wget https://github.com/m-mjd/faster/raw/main/faster.sh -O - | bash"; then
    echo "اسکریپت قبلا به crontab اضافه شده است."
else
    (crontab -l ; echo "0 0 * * * https://github.com/m-mjd/faster/raw/main/faster.sh -O - | bash") | crontab -
    echo "دستور با موفقیت به crontab اضافه شد."
fi
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
