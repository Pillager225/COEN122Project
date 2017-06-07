import sys

f = open(sys.argv[1], 'r')
o = open('out.txt', 'w')
for line in f:
	words = line.split(' ')
	if len(words) >= 1:
		binNum = words[0]+words[1]+words[2]+words[3]+words[4]
		o.write(hex(int(binNum, 2)))
		o.write('\n')
o.flush()
o.close()
f.close()