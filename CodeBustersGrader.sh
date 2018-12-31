#/usr/bin/bash

make clean
./filecheck $1
# Run key_formatter.py
./key_formatter.py KEY.txt
# list files, pipe into grep and search for _NUM.txt file pattern
# print those results into a variable
studentAns=$(ls | grep -P '_\d+.txt')
for file in $studentAns
do
	echo $file
	./student_answer_formatter.py file
done
make grader
./grader KEY.txt $studentAns
rankingsSheet=$(ls | grep -P '.*Codebusters_Rankings.txt')
