#check how many speakers in the welsh
#common voice dataset and how many
#recordings for each.

#create a new metadata file with only files
#from the speaker with the most recordings.

val = '/Users/arie/Downloads/cv-corpus-12.0-2022-12-07/nl/validated.tsv'

f = open(val,'r')
t = f.read()
f.close()

t = t.split('\n')
t = t[1:]
t = t[:-1]

speakers = {}
for line in t:
	bits = line.split('\t')
	if len(bits) > 0:
		speaker = bits[0]
		if speaker in speakers:
			speakers[speaker] += 1
		else:
			speakers[speaker] = 1

print(len(speakers))
speakerItemsSorted = sorted(speakers.items(),key=lambda x: x[1])
print(speakerItemsSorted[-1])
best = speakerItemsSorted[-1][0]
print(best)

g = open('onespeaker.csv','w')
for line in t:
	bits = line.split('\t')
	if len(bits) > 2 and bits[0] == best:
		g.write(f'{bits[1][:-4]}|{bits[2]}|{bits[2]}\n')
g.close()

