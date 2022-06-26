#!/bin/bash
here="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
cd $here

source ~/venvs/radiometeor/bin/activate
python meteor_radar.py -v -c --decimate $*

# Supported gain values (29): 
# 0.0 0.9 1.4 2.7 3.7 7.7 8.7 12.5 14.4 
# 15.7 16.6 19.7 20.7 22.9 25.4 28.0 29.7 
# 32.8 33.8 36.4 37.2 38.6 40.2 42.1 43.4 
# 43.9 44.5 48.0 49.6
