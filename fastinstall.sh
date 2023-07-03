#!/bin/bash
sudo apt-get update
sudo apt-get install git -y
git clone https://github.com/m-mjd/faster.git
cd faster
chmod +x faster.sh
./faster.sh
