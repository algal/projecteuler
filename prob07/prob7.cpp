#include<iostream>

/* Test primality via trial division. */
bool isPrime(int n) {
  if(n==1)
    return false;
  for(int i=2; i < n; ++i) 
    {
      if( n % i ==0) 
	return false;
    }
  return true;
}


int main()
{
  int count=1;
  int n=0;
  while(count<=10001) {
    ++n;
    if(!isPrime(n))
      continue;

    std::cout << "The " << count++ << "th prime is " << n << std::endl;
  }
}


    
