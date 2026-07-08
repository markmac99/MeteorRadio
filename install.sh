#!/bin/bash

# simple install script 
here="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

echo "install necessary libraries..."
sudo apt update && sudo apt install rtl-sdr libopenblas-dev python3-virtualenv

if [ ! -d ~/vMeteorRadio ] ; then
    echo "create python Virtualenv..."
    virtualenv ~/vMeteorRadio
    pip install --upgrade pip
fi
# activate the virtualenv in bashrc
grep vMeteorRadio ~/.bashrc > /dev/null 2>&1
if [ $? == 1 ] ; then
    echo "activating virtualenv in bashrc"
    echo "#" >> ~/.bashrc
    echo "source ~/vMeteorRadio/bin/activate" >> ~/.bashrc
fi

echo "activating env and installing python modules"
source ~/vMeteorRadio/bin/activate
cd $here
pip install -r $here/requirements.txt

echo "done!"
