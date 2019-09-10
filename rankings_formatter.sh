#/usr/bin/bash

if [[ $1 != *.txt ]]
	then
		echo "Rankings Sheet Improperly Named"
		exit 1
fi
echo $1 > temp.txt
tournamentName=$(sed 's/_Codebusters_Rankings.txt//' temp.txt)
echo $tournamentName
hrFormName="${tournamentName}_Codebusters_Rankings_hr.md"
echo $hrFormName
rm -f "${hrFormName}"
echo "Codebusters Rankings - ${tournamentName}" > "${hrFormName}"
echo "***" >> "${hrFormName}"
echo "| Rank | Team Name | Team Number | Score |" >> "${hrFormName}"
echo "|-----|:---------:|:-----------:|------:|" >> "${hrFormName}"
rm -f temp.txt
cp "$1" temp.txt
sed -i '1 d' temp.txt
sed -i 's/[[:space:]]\+/ | /g' temp.txt
sed -i 's/^/| /' temp.txt
sed -i 's/$/ |/' temp.txt
cat temp.txt >> "${hrFormName}"
cat "${hrFormName}"
rm -f temp.txt
