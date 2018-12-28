grader: grader.c grader.h
	gcc -o grader grader.c -Wall -Werror
debug: grader.c grader.h
	gcc --debug grader grader.c -Wall -Werror
.PHONY: clean
clean:
	$(RM) grader
