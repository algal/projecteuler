#include<iostream>
#include<vector>
#include<list>

#include <boost/cstdint.hpp>
using boost::uint64_t;

using std::list;
using std::vector;
using std::cout;
using std::endl;


/* prints every item in C */
template<typename C> 
void print(C const & c) 
{ 
  std::cout << "{";
  for(typename C::const_iterator i=c.begin(),e=c.end(); i!=e; ++i) { 
    cout << *i << ", "; 
  } 
  std::cout << "}";
} 

/* returns a vector, with primes[i] telling if i is prime for i < n 

   Uses the sieve of eratosthenes.
*/
std::vector<bool> primeFlags(const long n) 
{
  vector<bool> primes(n,true); 
  primes[1]=false;

  // iterate thru every number
  for(long i=2; i < n; ++i) {
    // if we're encountering a new prime
    if(primes[i] == true) {
      for(long j=(i+i); j < n; j=j+i) {
	primes[j]=false;
      }
    }
  }
  return primes;
}

/* Returns a list of primes < n */
list<int> primesTo(const unsigned int n) {
  list<int> primes;
  
  vector<bool> v = primeFlags(n);
  for(unsigned int i=2; i < n; ++i) {
    if(v[i] == true) {
      primes.push_back(i);
    }
  }
  return primes;
}

/* Sums primes under n */
uint64_t sumPrimesTo(const unsigned long n) {
  uint64_t sum=0;

  const vector<bool> primes = primeFlags(n);
  for(unsigned long i = 2; i < n; ++i) {
    if(primes[i] == true) {
      sum += i;
    }
  }
  
  return sum;
}


int main()
{
  const unsigned long limit = 2000000;

  cout << "sum of primes < " << limit << " = " << sumPrimesTo(limit) << endl;
  cout << "primeFlags(20) = ";
  //  vector<bool> primes = sieve(21);
  //  print(primes);
  print(primeFlags(21));
  cout << endl;

  cout << "primesTo(20) = ";
  print(primesTo(20));
  cout << endl;

}
