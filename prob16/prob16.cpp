#include<sstream>
#include<iostream>
#include<vector>

#include<boost/cstdint.hpp>
using boost::uint64_t;

#include <gmpxx.h>

//#include <NTL/ZZ.h>

using std::endl;
using std::cout;
using std::vector;
using std::string;
using std::ostringstream;

/* Returns digits of n */
vector<int> integerDigits(const unsigned long n) {
  std::ostringstream stream;
  stream << n;
  const std::string s = stream.str();

  vector<int> digits;
  
  for(string::const_iterator i=s.begin(), e = s.end(); i!=e; ++i) {
    // dirty C hack to convert chars to ints
    const int ii = *i - '0';
    digits.push_back(ii);
  }
  
  return digits;
}

unsigned long sumDigits(const long n) {
  vector<int> digits = integerDigits(n);

  unsigned long sum=0;
  for(vector<int>::const_iterator i =digits.begin(), e=digits.end(); i != e; ++i) {
    sum += *i;
  }

  return sum;
}

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


int main()
{
  //  NTL::ZZ a;

     mpz_t integ;
     mpz_init(integ);
     mpz_set_ui(integ, 2);

     mpz_clear(integ);

  print(integerDigits(123));
  std::cout << "sumDigits(123) = " << sumDigits(123) << std::endl;
}
