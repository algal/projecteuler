#include <iostream>
#include <map>

using namespace std;

/* Populates factors with the powers of n's prime factors */
void factorInteger(long n, map<long,int> &factors) 
{
  // initialise factors to 0

  // start trying candidate factors
  for(long candidate=2; n > 1 && candidate^2 < (1+n^2); ++candidate) {
    std::cout << "trying candidate = " << candidate;;

    if(n % candidate == 0) {
      factors[candidate]=0;
    }

    // if candiate is a factor ..
    while(n % candidate == 0) {
      // then factor out all its multiples
      n = n / candidate;
      factors[candidate] += 1;
    }
  }

  return;
}


/* Returns the largest prime factor of n */
long biggestFactor(long n)
{
  // the largest factor so far
  long factor = 1;
  // a candidate factor
  long candidate = 2;

  // as long as n is not completely factored ...
  while(n > 1) {
    // ... try our next candidate factor
    if(n % candidate == 0) {
      // if it is a factor, remember it as the highest so far,
      factor = candidate;

      //  and divide it out of n
      n = n / factor;
      while(n % factor == 0) {
	n = n / factor;
      }
    }
    // then prepare to try the next highest factor
    candidate += 1;
  }
  return factor;
}



// prints the map
void printmap(std::map<long,int> mmap) {
  clog << "   map = ";
  clog << "{ ";

  for(map<long,int>::iterator thisitem_iter = mmap.begin();
      thisitem_iter != mmap.end(); 
      ++thisitem_iter) {
    clog << thisitem_iter->first << ":" << thisitem_iter->second << ", ";
  }
  clog << "}" << endl;
}

main()
{
  long k = 7*2*5*5*3*3;
  //  long k = 600851475143;
  long factor = biggestFactor(k);
  std::cout << "largest factor of " << k << " is " << factor << std::endl;

  std::map<long,int> m;
  factorInteger(k,m);
  printmap(m);

  std::cout << "sizeof char* = " << sizeof(char*) << std::endl;
  std::cout << "sizeof lond = " << sizeof(long) << std::endl;
}

