grader: grader.o
	g++ grader.o -o grader
debug: grader.o
	g++ --debug grader.o -o grader
grader.o: grader.cpp
	g++ -Wall -Werror grader.cpp grader.h -o grader.o
.PHONY: clean
.PHONY: debug
clean:
	$(RM) grader
