#!/bin/bash
here="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
source ~/venvs/radiometeor/bin/activate

# eval needed here to expand any ~ 
eval datadir=$(grep datadir ~/.radar_config | awk '{print $2}')

cd $datadir
find $datadir/Captures -name "*.wav" -mtime -7 -exec rm -f {} \;
find $datadir/Captures -name "*.png" -mtime -7 -exec rm -f {} \;
find $datadir/Captures -name "*.raw" -mtime -7 -exec rm -f {} \;
find $datadir/Captures -name "*.jpg" -mtime -7 -exec rm -f {} \;
find $datadir/Captures -name "*.npz" -mtime -7 -exec rm -f {} \;