#!/usr/bin/env python
# -*- coding: utf-8 -*-
import sys
from itertools import islice
import re
from os import remove

def fixLine(line):
	r = re.compile(r"[^a-zA-Z0-9ñÑ]")
	line = r.sub("", line)
	line = line.upper()
	return line
	

def main():
	if (len(sys.argv) != 2):
		print ('Incorrect Number of Arguments\n')
		exit(1)
	input_name = sys.argv[1]
	if(input_name != 'KEY.txt'):
		print('Answer Key must be named KEY.txt')
		exit(1)
	newLine = []
	with open(input_name, 'r') as fin:
		firstLine = True
		for line in islice(fin, 0, None):
			if(firstLine):
				firstLine = False
				line = [line.rstrip('\n'), 'CodeBusters Answer Key']
			else:
				line = re.split(r'\t+', line)
				line[0] = fixLine(line[0])
				line[1] = line[1].rstrip('\n')
			newLine.append(line)
	remove(input_name)
	with open(input_name, 'w') as fout:
		for elem in newLine:
			fout.write('{}\t{}\n'.format(elem[0], elem[1]))
			
		
if __name__=='__main__':
	main()
