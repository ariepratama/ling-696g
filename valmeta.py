#convert common-voice validated.tsv to
#LJSpeech-style metadata.csv

val = '/data/cv-corpus-7.0-2021-07-21/cy/validated.tsv'

f = open(val,'r')
t = f.read()
f.close()

t = t.split('\n')

g = open('metadata.csv','w')
for line in t[1:]:
	bits = line.split('\t')
	if len(bits) > 2:
		g.write(f'{bits[1][:-4]}|{bits[2]}|{bits[2]}\n')
g.close()

