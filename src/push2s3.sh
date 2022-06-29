#!/bin/bash
here="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
source ~/venvs/radiometeor/bin/activate

# eval needed here to expand any ~ 
eval datadir=$(grep datadir ~/.radar_config | awk '{print $2}')

cd $datadir
logf=$(ls -1 Logs/event*.csv | tail -1)
bn=$(basename $logf)
aws s3 cp $logf s3://mjmm-rawradiodata/tmp/${bn} --profile=default
