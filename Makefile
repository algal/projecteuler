CPP = g++

BOOSTHEADERS = -I /sw/include/boost-1_35/

GMPHEADERS = -I /sw/include
GMPLIB = -L /sw/lib/libgmp.a

# NTL dependson GMP
NTLHEADERS = -I /sw/include/
NTLLIB = -L /sw/lib/libntl.a -L /sw/lib/libgmp.a

INCLUDES =  $(GMPHEADERS) $(NTLHEADERS) $(BOOSTHEADERS)
LIBS = $(NTLLIB)

.PHONY: run all

a.out :
	$(CPP) -Wall $(INCLUDES)  $(LIBS)  *cpp -o a.out 
clean : 
	rm -f ./a.out

all : a.out

run :
	./a.out
