#/usr/bin/bash

echo $1 > temp.txt
team=$(sed 's/.txt//' temp.txt)
newFileName="$team"_"$3"_Score_Sheet.txt
echo $newFileName
rm -f temp2.txt
cp "$1" temp.txt
sed -i '1 d' temp.txt
cat temp.txt | tr '\r\n' ' ' > temp2.txt #replace \n with spaces
studentAns=()
read -a studentAns < temp2.txt
echo ${studentAns[*]}
cp "$2" temp.txt
rm -f temp2.txt temp3.txt
sed -i '1 d' temp.txt
cut -f1 -s temp.txt > temp2.txt
cat temp2.txt | tr '\r\n' ' ' > temp3.txt #replace \n with spaces
correctAns=()
read -a correctAns < temp3.txt
echo ${correctAns[*]}
#echo "Student Answer	Correct Answer	Points	Diff" > "${newFileName}"
