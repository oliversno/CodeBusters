#/usr/bin/bash

echo $1 > temp.txt
team=$(sed 's/.txt//' temp.txt)
newFileName=$($team_$3_Score_Sheet.txt)
rm -f temp2.txt
cp "$1" temp.txt
sed -i '1 d' temp.txt
cat temp.txt | tr '\r\n' ' ' > temp2.txt #replace \n with spaces
studentAns=()
read -a studentAns < temp2.txt
echo ${studentAns[*]} 
#echo "Student Answer	Correct Answer	Points	Diff" > "${newFileName}"
