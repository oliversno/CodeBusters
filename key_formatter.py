#!/usr/bin/env python
import sys
from itertools import islice
import re

def fixLine(line):
	line = re.sub('\W+','', line)
	line = line.upper()
	return line
	

def main():
	if (len(sys.argv) != 2):
		print ('Incorrect Number of Arguments\n')
		exit(1)
	input_name = sys.argv[1]
	newLine = []
	with open(input_name, 'r') as fin:
		firstLine = True
		for line in islice(fin, 0, None):
			if(firstLine):
				firstLine = False
				line = line.rstrip('\n')
			else:
				line = fixLine(line)
			newLine.append(line)
	for elem in newLine:
		print (elem)
if __name__=='__main__':
	main()
