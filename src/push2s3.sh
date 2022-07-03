#!/bin/bash
here="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
source ~/venvs/radiometeor/bin/activate

# eval needed here to expand any ~ 
eval datadir=$(grep datadir ~/.radar_config | awk '{print $2}')

cd $datadir
dtstr=$(date +%Y%m)
logf=event_log_${dtstr}.csv
fullname=$datadir/Logs/$logf

python ~/source/radiometeor/createEventLogFile.py $dtstr
aws s3 cp ${fullname} s3://mjmm-rawradiodata/raw/${logf} --profile=default
