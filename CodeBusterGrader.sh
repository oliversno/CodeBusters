#/usr/bin/bash

# Make sure input is a .tar file
if [[ $1 != *.tar ]]
	then 
		echo "Input must be a single .tar file"
		exit 1
fi
# eXtract Ze Files
tar -xzf $1
# Make sure KEY.txt was in the tarball
if [ ! -f KEY.txt ]
	then
		echo "No file name KEY.txt found"
		echo "Either Answer Key does not exist or is  incorrectly named"
		exit 1
fi
# Make sure key_formatter.py exists
if [ ! -f key_formatter.py ]
	then
		echo "key_formatter.py not found"
		echo "Get a correct copy of CodeBustersGrader at https://github.com/oliversno/CodeBustersGrader"
		exit 1
fi
# Run key_formatter.py
./key_formatter.py KEY.txt
# list files, pipe into grep and search for _NUM.txt file pattern
# print those results into a variable
studentAns=$(ls | grep -P '_\d+.txt')
echo $studentAns
