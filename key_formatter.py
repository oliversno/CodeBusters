import sys
from itertools import islice
import re
def fixLine(line):
	re.sub('\W+','', line)
	line.upper()
	return
	

def main():
	if (len.argv != 1):
		print 'Incorrect Number of Arguments\n'
		exit(1) 
	input_name = sys.argv[0]
	with open(input_name) as fin:
		for line in islice(fin, 2, None):
			fixLine(line)
