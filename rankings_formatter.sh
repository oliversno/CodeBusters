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
rm temp.txt
