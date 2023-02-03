#tweaked nr1.py for glow-TTS with common-voice Welsh
#convert files from mp3 to wav with fs=22050

import os

oldfiledir = '/Users/arie/Downloads/cv-corpus-12.0-2022-12-07/nl/'
newfiledir = '/Users/arie/Downloads/cv-corpus-12.0-2022-12-07/nl/'

filenames = os.listdir(oldfiledir+'clips')

os.system('mkdir ' + newfiledir)
os.system('mkdir ' + newfiledir+'wavs/')

for filename in filenames:
	newname = filename[:-3] + 'wav'
	os.system(
		'ffmpeg -i ' + oldfiledir + 'clips/' + \
		filename + ' -ar 22050 ' + newfiledir + \
		'wavs/' + newname
	)

