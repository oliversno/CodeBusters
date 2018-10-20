#/usr/bin/bash

# Make sure input is a .tar file
if [[ $1 != *.tar ]]
	then 
		echo "Input must be a single .tar file"
		exit 1
fi
# eXtract Ze Files
tar -xzf $1

if [ ! -f KEY.txt ]
	then
		echo "No file name KEY.txt found."
		echo "Either Answer Key does not exist or is not incorrectly"
		exit 1
fi
