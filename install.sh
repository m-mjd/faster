#!/bin/bash
(crontab -l ; echo "0 0 * * * wget https://github.com/m-mjd/faster/raw/main/faster.sh -O - | bash") | crontab -
wget https://github.com/m-mjd/faster/raw/main/faster.sh -O - | bash
read -n 1 -s -r -p "برای پایان، یک دکمه را فشار  ..."
