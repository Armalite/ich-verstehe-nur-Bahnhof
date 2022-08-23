# Makefile - compare file timestamps

Inside a make target you can compare the timestamps of two different files and determine a course of action based on this:
```bash
compare:
	FILE1=$$(stat -f "%Sm" -t "%m%d%H%M%y" file1.yml);\
    FILE2=$$(stat -f "%Sm" -t "%m%d%H%M%y" file2.yml);\
	if [ $$FILE1 -gt $$FILE2 ];\
	then\
		echo FILE1 has been modified more recently than FILE2;\
	else\
		echo FILE2 has been modified more recently than FILE1;\
	fi;
```