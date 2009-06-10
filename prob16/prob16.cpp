#include<sstream>
#include<iostream>
#include<vector>
#include<memory>

#include<boost/cstdint.hpp>
using boost::uint64_t;

#include<boost/shared_ptr.hpp>
using boost::shared_ptr;

#include <gmpxx.h>

using std::endl;
using std::cout;
using std::vector;
using std::string;
using std::ostringstream;
using std::auto_ptr;

/* Returns digits of n as vector */
vector<int> integerDigits(const std::string& s)
{
  vector<int> digits;
  
  for(string::const_iterator i=s.begin(), e = s.end(); i != e; ++i) {
    // dirty C hack to convert chars to ints
    const int ii = *i - '0';
    digits.push_back(ii);
  }
  
  return digits;
}

/* Returns digits of n as vector */
vector<int> integerDigits(const mpz_t bignum) {
  char * resultp = mpz_get_str(NULL,10,bignum);
  std::string s(resultp);
  free( resultp );

  return integerDigits(s);
}


/* Returns digits of n */
vector<int> integerDigits(const unsigned long n) {
  std::ostringstream stream;
  stream << n;
  const std::string s = stream.str();
  return integerDigits(s);
}

template<typename T>
unsigned long sumDigits(T n) {
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
  mpz_t result, base;
  unsigned int exponent = 1000;
  mpz_init_set_str(result,"2",10);
  mpz_init_set_str(base,"2",10);
  mpz_pow_ui(result,base,exponent);

  char* resultstr = mpz_get_str(NULL,10,result);
  //  unsigned int x = mpz_get_ui(integ)


  std::cout << "2 ^ " << exponent << " = " << resultstr << std::endl;

  std::cout << "sum of digits in 2^1000=" << sumDigits(result) << std::endl;
}
