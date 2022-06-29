#!/bin/bash
if [ "$1" == "" ] ; then 
    fldr=.
else
    fldr=$1
fi
mkdir -p  Wavs > /dev/null 
outdir=~/radar_data/Wavs
flist=$(ls -1 $fldr/*.raw) 
for f in $flist ; do  
    echo $f 
    python -c "from play_audio import convertRawToWav; convertRawToWav('${f}','${outdir}');"
done
