#!/bin/bash
if [ "$1" == "" ] ; then 
    fldr=.
else
    fldr=$1
fi
mkdir -p  Wavs > /dev/null 
flist=$(ls -1 $fldr/*.raw) 
for f in $flist ; do  
    echo $f 
    sox -r 37.5k -b 16 -e signed-integer -c 1 $f ~/radar_data/Wavs/$(basename $f .raw).wav 
done
