#!/bin/bash
here="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
cd $here

sudo apt-get update
sudo apt-get install -y python3 rtl-sdr libusb-dev libatlas-base-dev sox chrony python3-pip
pip install virtualenv 

export PATH=$PATH:~/.local/bin
if [ ! -d ~/venvs/radiometeor ] ; then 
    virtualenv -p python3 ~/venvs/radiometeor
fi 
source ~/venvs/radiometeor/bin/activate

pip install -r ${here}/requirements.txt

if [ ! -f ~/.radar_config ] ; then
    read -p "press any key to edit the config file "
    cp .radar_config.sample ~/.radar_config
    nano ~/.radar_config
fi 
