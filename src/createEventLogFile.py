# create eventlog file in required format

import os
import sys


def createEventLogFile(srcfile):
    pth, fname = os.path.split(srcfile)
    yr = fname[:4]
    mth = fname[5:7]
    outf = f'event_log_{yr}{mth}.csv'
    outf = os.path.join(pth, outf)    
    print(f'processing data for {yr} {mth} to {outf}')

    with open(srcfile, 'r') as inf:
        flines = inf.readlines()

    hourcount = 0
    curr_hr = -1
    with open(outf,'w') as ofp:
        for fli in flines:
            fli = fli.strip()
            spls = fli.split(',')
            if spls[0] == 'user_ID':
                continue
            dtstr = spls[1].replace('-','/')
            tmstr = spls[2]
            hrval = int(tmstr[:2])
            if hrval != curr_hr:
                hourcount = 1
                curr_hr = hrval
            else:
                hourcount += 1
            sig = spls[3]
            noi = spls[4]
            fre = spls[5]
            dur = spls[7]
            snr = spls[12]
            dop = spls[13]
            outstr = f'{dtstr},{tmstr[:8]},{hourcount},{sig},{noi},{snr},{fre},{dur},{dop}\n'
            ofp.write(outstr)


if __name__ == '__main__':
    if len(sys.argv) < 2:
        print('need YYYYMM')
        exit(1)
    
    ym = sys.argv[1]
    yr = ym[:4]
    mth = ym[4:]
    logdir = os.path.expanduser('~/radar_data/Logs')
    fname = os.path.join(logdir, f'{yr}-{mth}.csv')
    if os.path.isfile(fname):
        createEventLogFile(fname)
