#!/usr/bin/env bash

echo "Installing: ( 1 ) bcm2835 and ( 2 ) boost-libraries"

# Install bcm2835.h:
#   bcm2835.h is library for C/C++ to allow developer access GPIO and
#   other I/O functions on the Broadcom bcm2835.
#
echo "Install bcm2835.h: starting"
sudo wget http://www.airspayce.com/mikem/bcm2835/bcm2835-1.50.tar.gz >>/tmp/provision-script.log 2>&1
tar zxvf bcm2835-1.50.tar.gz >>/tmp/provision-script.log 2>&1
rm bcm2835-1.50.tar.gz >>/tmp/provision-script.log 2>&1
cd bcm2835-1.50 >>/tmp/provision-script.log 2>&1
./configure >>/tmp/provision-script.log 2>&1
make >>/tmp/provision-script.log 2>&1
sudo make check >>/tmp/provision-script.log 2>&1
sudo make install >>/tmp/provision-script.log 2>&1
echo "Install bcm2835.h: DONE"

echo "Updating: starting"
sudo apt-get update >>/tmp/provision-script.log 2>&1
echo "Updating: DONE"

# Install boost libraries:
#   The boost libraries have some libraries will very useful, like Threads.
#
#   The boost libraries are big and using their functions can cause compiling
#   to become very slow when changing source code in any files that use boost
#   due to the slow access the RPi has to is SD card hard disk.
#
#   Install all of boost (250MB+ of space needed).
#
#   TODO: search some way to install the libraries we really need.
#
echo "Install boost-libraries: starting"
sudo apt-get install libboost-all-dev -y >>/tmp/provision-script.log 2>&1
echo "Install boost-libraries: DONE"

