#include<iostream>

long biggestFactor(long n)
{
  long candidate = 2;
  long factor = 1;
  while(n > 1) {
    if(n % candidate == 0) {
      factor = candidate;
      n = n / factor;
      while(n % factor == 0) {
	n = n / factor;
      }
    }
    candidate += 1;
  }
  return factor;
}

main()
{
  long long k = 600851475143;
  long factor = biggestFactor(k);
  std::cout << "largest factor of " << k << " is " << factor << std::endl;
}
