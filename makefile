grader: grader.o
	gcc grader.o -o grader
debug: grader.o
	gcc --debug grader.o -o grader
grader.o: grader.cpp
	gcc -Wall -Werror grader.cpp grader.h -o grader.o
.PHONY: clean
.PHONY: debug
clean:
	$(RM) grader
