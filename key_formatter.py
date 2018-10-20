#!/usr/bin/env python
import sys
from itertools import islice
import re

def fixLine(line):
	print (line)
	re.sub('\W+','', line)
	line.upper()
	print (line)
	return
	

def main():
	if (len(sys.argv) != 2):
		print ('Incorrect Number of Arguments\n')
		exit(1)
	input_name = sys.argv[1]
	with open(input_name) as fin:
		for line in islice(fin, 1, None):
			fixLine(line)

if __name__=='__main__':
	main()
