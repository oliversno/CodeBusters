grader: grader.o
	g++ -Wall -Werror grader.cpp grader.h -o grader
debug: grader.o
	g++ -g -Wall -Werror grader.cpp grader.h -o grader
.PHONY: clean
.PHONY: debug
clean:
	$(RM) grader
