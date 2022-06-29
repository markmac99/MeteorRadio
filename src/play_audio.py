# python script to play an audio file using openCV
import os
import time
import sys
import datetime 
from ffpyplayer.player import MediaPlayer
import wave


def convertRawToWav(rawfile, outdir=None):
    with open(rawfile, 'rb') as pcmfile:
        pcmdata = pcmfile.read()
    fn, _ = os.path.splitext(rawfile)
    if outdir is not None:
        outdir = os.path.expanduser(outdir)
        _,fn = os.path.split(fn)
        fn = os.path.join(outdir, fn)
    outf = fn + '.wav'
    with wave.open(outf, 'wb') as wavfile:
        wavfile.setparams((1, 2, 37500, 0, 'NONE', 'NONE'))
        wavfile.writeframes(pcmdata)
    return outf


def playFile(video_path):
    player = MediaPlayer(video_path)
    starttime = datetime.datetime.now()
    while 1:
        frame, val = player.get_frame()
        if (datetime.datetime.now() - starttime).seconds > 10:
            break
        elif frame is None:
            time.sleep(0.01)
        else:
            time.sleep(val)


if __name__ == '__main__':
    wavf = convertRawToWav(sys.argv[1])
    wavf = sys.argv[1].replace('.raw', '.wav')
    playFile(wavf)
    os.remove(wavf)
