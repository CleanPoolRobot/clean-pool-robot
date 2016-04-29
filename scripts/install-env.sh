#!/usr/bin/env bash

GREEN='\033[1;32m'
NOCOLOR='\033[0m'

echo -e "${GREEN}Update: starting"
sudo apt-get update >>/tmp/provision-script.log 2>&1
echo -e "${GREEN}Update: DONE"

echo -e "${GREEN}Zip: starting"
sudo apt-get install zip -y >>/tmp/provision-script.log 2>&1
sudo apt-get install unzip -y >>/tmp/provision-script.log 2>&1
echo -e "${GREEN}Zip: DONE"

echo -e "${GREEN}Git: starting"
sudo apt-get install git -y >>/tmp/provision-script.log 2>&1
echo -e "${GREEN}Git: DONE"

echo -e "${GREEN}Download Raspbian: starting"
echo -e "${GREEN}It should take a few minutes..."
wget https://www.dropbox.com/s/nct30w78kv3m82r/rpi.zip?dl=0 \
     -P ./environment/ >>/tmp/provision-script.log 2>&1

mv ./environment/rpi.zip?dl=0 ./environment/rpi.zip
unzip ./environment/rpi.zip -d ./environment/ >>/tmp/provision-script.log 2>&1
rm ./environment/rpi.zip
echo -e "${GREEN}Download Raspbian: DONE"

echo -e "${GREEN}Qemu: starting"
sudo apt-get install qemu-system -y >>/tmp/provision-script.log 2>&1
qemu-system-arm --version
echo -e "${GREEN}Qemu: DONE"

echo -e "${GREEN}Kernel-rpi: starting"
echo -e "${GREEN}It should take a few minutes..."
wget https://github.com/dhruvvyas90/qemu-rpi-kernel/archive/master.zip \
     -P ./environment/ >>/tmp/provision-script.log 2>&1

unzip ./environment/master.zip -d ./environment/ >>/tmp/provision-script.log 2>&1
mv ./environment/qemu-rpi-kernel-master ./environment/qemu-rpi-kernel
rm master.zip
echo -e "${GREEN}Kernel-rpi: DONE${NOCOLOR}"
