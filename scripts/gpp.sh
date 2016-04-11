#!/usr/bin/env bash

echo "Installing: ( 1 ) g++, ( 2 ) gcc and ( 3 ) make"

# Install g++:
#   g++ is a compiler to C++
#
echo "Install g++: starting"
sudo apt-get install g++ -y >>/tmp/provision-script.log 2>&1
echo "Install g++: DONE"

# Install gcc:
#   gcc is a compiler to C
#
echo "Install gcc: starting"
sudo apt-get install gcc -y >>/tmp/provision-script.log 2>&1
echo "Install gcc: DONE"

# Install Make:
#
echo "Install Make: starting"
sudo apt-get install build-essential -y >>/tmp/provision-script.log 2>&1
echo "Install Make: DONE"
