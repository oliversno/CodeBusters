#/usr/bin/bash

echo $1 > temp.txt
team=$(sed 's/.txt//' temp.txt)
newFileName="$team"_"$3"_Score_Sheet.txt
hrFileName="$team"_"$3"_hr.md
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
rm -f temp2.txt temp3.txt
cut -f2 -s temp.txt > temp2.txt
cat temp2.txt | tr '\r\n' ' ' > temp3.txt #replace \n with spaces
points=()
read -a points < temp3.txt
echo ${points[*]}
echo "Student Answer	Correct Answer	Points	Diff" > "${newFileName}"
echo "${team} Score Sheet - $3" > "${hrFileName}"
echo "***" >> "${hrFileName}"
echo "| Student Answer | Correct Answer | Points |		Diff	|" >> "${hrFileName}"
echo "|:--------------:|:--------------:|-------:|:--------------:|" >> "${hrFileName}"
for i in ${!studentAns[*]}
do
	highlighted=$(./highlight.sh ${studentAns[i]} ${correctAns[i]})
	echo ${studentAns[i]}	${correctAns[i]}	${points[i]}	${highlighted//\\n/} >> "${newFileName}"
	echo "| ${studentAns[i]} | ${correctAns[i]} | ${points[i]} | ${highlighted//\\n/} |" >> "${hrFileName}"
done
rm -f temp.txt temp2.txt temp3.txt
