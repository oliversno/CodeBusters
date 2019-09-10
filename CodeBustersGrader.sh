#/usr/bin/bash

#make clean
./filecheck.sh $1
# Run key_formatter.py
./key_formatter.py KEY.txt
# list files, pipe into grep and search for _NUM.txt file pattern
# print those results into a variable
studentAns=$(ls | grep -P '\d+_.*.txt')
for file in $studentAns
do
	echo $file
	./student_answer_formatter.py $file
done
make grader
./grader KEY.txt $studentAns
rankingsSheet=$(ls | grep -P 'Codebusters_Rankings.txt$')
./rankings_formatter.sh $rankingsSheet
rm -f temp.txt
echo ${rankingsSheet} > temp.txt
tournamentName=$(sed 's/_Codebusters_Rankings.txt//' temp.txt)
for file in $studentAns
do
	./student_score_formatter.sh $file KEY.txt $tournamentName
done
