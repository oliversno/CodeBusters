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
# Make sure student_answer_formatter.py exists
if [ ! -f student_answer_formatter.py ]
	then
		echo "student_answer_formatter.py not found"
		echo "Get a correct copy of CodeBustersGrader at https://github.com/oliversno/CodeBustersGrader"
		exit 1
fi
# Make sure grader.cpp exists
if [ ! -f grader.cpp ]
	then
		echo "grader.cpp not found"
		echo "Get a correct copy of CodeBustersGrader at https://github.com/oliversno/CodeBustersGrader"
		exit 1
fi
# Make sure grader.h exists
if [ ! -f grader.h ]
	then
		echo "grader.h not found"
		echo "Get a correct copy of CodeBustersGrader at https://github.com/oliversno/CodeBustersGrader"
		exit 1
fi
# Make sure highlight.sh exists
if [ ! -f highlight.sh ]
    then
        echo "highlight.sh not found"
        echo "Get a correct copy of CodeBustersGrader at https://github.com/oliversno/CodeBustersGrader"
        exit 1
fi
# Make sure rankings_formatter.sh exists
if [ ! -f rankings_formatter.sh ]
    then
        echo "rankings_formatter.sh not found"
        echo "Get a correct copy of CodeBustersGrader at https://github.com/oliversno/CodeBustersGrader"
        exit 1
fi
# Make sure student_score_formatter.sh exists
if [ ! -f student_score_formatter.sh ]
    then
        echo "student_score_formatter.sh not found"
        echo "Get a correct copy of CodeBustersGrader at https://github.com/oliversno/CodeBustersGrader"
        exit 1
fi 
