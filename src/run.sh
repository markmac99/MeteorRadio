#!/bin/bash
here="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
cd $here

source ~/venvs/radiometeor/bin/activate
python meteor_radar.py