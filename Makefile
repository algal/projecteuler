CPP = g++ #/sw/bin/gcc-4
PYTHON = /sw/bin/python2.6
HASKELL = /usr/bin/ghc
LISP = /sw/bin/sbcl
JAVA = /usr/bin/javac

# libraries

# Boost provides basics to cpp
BOOSTHEADERS = -I /sw/include/boost-1_41/

# GMP provides bignums to c and cpp
GMPHEADERS = -I /sw/include
GMPLIB = -L /sw/lib/libgmpxx.a -L /sw/lib/libgmp.a
#GMPLIB = -L /sw/lib/libgmpxx.a -L /sw/lib/libgmp.a

# NTL dependson GMP
NTLHEADERS = -I /sw/include/
#NTLLIB = -L /sw/lib/libntl.a -L /sw/lib/libgmp.a
NTLLIB = -L/sw/lib/

INCLUDES =  $(GMPHEADERS) $(NTLHEADERS) $(BOOSTHEADERS)
LIBS = $(NTLLIB)

PYFILES = $(wildcard *.py)

.PHONY: runpy runcpp runhs haskell cpp

cpp :
	$(CPP) -Wall $(INCLUDES)  $(LIBS)  *.cpp -o a.out 

haskell :
	$(HASKELL) *.hs

clean : 
	rm -f ./a.out
	rm -f *.o
	rm -f *.hi

runhs : haskell
	./a.out

runcpp : cpp
	./a.out

runpy :
	$(PYTHON) $(PYFILES)

