CXX = g++ 
HASKELL = /usr/bin/ghc
LISP = /sw/bin/sbcl
JAVAC = /usr/bin/javac

PYTHON = /sw/bin/python2.6
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

SRCS = $(wildcard *.py *.hs *.cpp *.h *.lisp)

ABSPATH = $(subst /, ,$(PWD))

# infers lang from current directory
LANGUAGE = $(lastword $(ABSPATH))

# infers prob number from penultimate direcotry
PROBLEM = $(word $(words $(ABSPATH))-1,$(ABSPATH))

# See info/make/10.5.3 Automatic Variables 

.PHONY: runbinary clean cpp haskell java runhs runcpp runpy runjava



# determines the language, to determine the final build product
ifeq ($(LANGUAGE),java)
  compilable = prob01.class
else
  compilable = prob01.out
endif

run: $(compilable)

test:
	echo $(PROBLEM)
	echo $(LANGUAGE)

%.out : %.cpp
	$(CXX) -Wall $(INCLUDES)  $(LIBS)  $< -o $@

%.out %.o %.hi : %.hs
	$(HASKELL) -o $@ $<

%.class : %.java
	$(JAVAC) $^

runbinary : prob01.out
	./$<

runjava : prob01.class
	$(JAVA) prob01

runhs : haskell
	./hs.out

runcpp : cpp
	./cpp.out

runpy :
	$(PYTHON) $(PYFILES)

clean : 
	rm -f *.out
	rm -f *.o
	rm -f *.hi
	rm -f *.class

