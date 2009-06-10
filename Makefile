CPP = g++
INCLUDES = /sw/include/boost-1_35/

.PHONY: run all

a.out :
	$(CPP) -I $(INCLUDES) -Wall *cpp -o a.out


clean : 
	rm -f ./a.out

all : a.out

run :
	./a.out
