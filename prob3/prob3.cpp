#include <iostream>
#include <map>

#include <boost/cstdint.hpp>

using namespace boost;
using namespace std;

/* Populates factors with the powers of n's prime factors */
void factorInteger(boost::uint64_t n, map<boost::uint64_t,unsigned int> &factors) 
{
  // start trying candidate factors
  for(boost::uint64_t candidate=2; n > 1 && candidate^2 < (1+n^2); ++candidate) {

    // initialise factors to 0
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


/* Returns the largest prime factor of n. 


   This function takes [2,3,...,inf] as a list of candidate factors,
   and one by one tries to divide them out of n as many times as is
   possible. Since it tries repeatedly on a factor, it will
   automatically divide out powers of that factor. Thus, it will only
   divide out primes. Since the candidates are listed in order, the
   last factor to divide out successfuly will be the highest prime
   factor of n.
*/
long biggestFactor(boost::uint64_t n)
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
void printmap(std::map<boost::uint64_t,unsigned int> mmap) {
  clog << "   map = ";
  clog << "{ ";

  for(map<boost::uint64_t,unsigned int>::iterator thisitem_iter = mmap.begin();
      thisitem_iter != mmap.end(); 
      ++thisitem_iter) {
    clog << thisitem_iter->first << ":" << thisitem_iter->second << ", ";
  }
  clog << "}" << endl;
}

main()
{
  boost::uint64_t k = 600851475143LL;
  long factor = biggestFactor(k);
  std::cout << "largest factor of " << k << " is " << factor << std::endl;

  std::map<boost::uint64_t,unsigned int> m;
  factorInteger(k,m);
  printmap(m);

  std::cout << "sizeof char* = " << sizeof(char*) << std::endl;
  std::cout << "sizeof lond = " << sizeof(long) << std::endl;
}

