CPP = g++ 
PYTHON = /sw/bin/python2.6
HASKELL = /usr/bin/ghc
LISP = /sw/bin/sbcl
JAVAC = /usr/bin/javac
JAVA = /usr/bin/java

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

.PHONY: clean cpp haskell java runhs runcpp runpy runjava

clean : 
	rm -f ./a.out
	rm -f *.o
	rm -f *.hi
	rm -f *.class

cpp :
	$(CPP) -Wall $(INCLUDES)  $(LIBS)  *.cpp -o cpp.out 

haskell :
	$(HASKELL) -o hs.out *.hs

java :
	$(JAVAC) *.java

runhs : haskell
	./hs.out

runcpp : cpp
	./cpp.out

runpy :
	$(PYTHON) $(PYFILES)

runjava : java
	java prob01
