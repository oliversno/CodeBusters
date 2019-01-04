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
	splitName = re.split(r'_', input_name)
	teamNum = splitName[0]
	teamName = splitName[1]
	formattedNameNum = teamNum + '\t' + teamName
	newLine = []
	with open(input_name, 'r') as fin:
		firstLine = True
		for line in islice(fin, 0, None):
			if(firstLine):
				firstLine = False
				line = line.rstrip('\n')
				txtline = line + ".txt"
				if(txtline != formattedNameNum):
					print ('File Name does not match File Header!')
					exit(1)
			else:
				line = fixLine(line)
			newLine.append(line)
	remove(input_name)
	with open(input_name, 'w') as fout:
		for elem in newLine:
			fout.write('{}\n'.format(elem))
			
		
if __name__=='__main__':
	main()
