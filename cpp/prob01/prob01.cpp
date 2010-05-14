#include<iostream>

/**
   Returns sum of all numbers divisible by 3 or 5.
 */
int foo()
{
     int sum=0;
     for(int i=0; i<1000;++i)
     {
	  if(i%3==0 || i%5==0)
	       sum+=i;
     }
     return sum;
}


int main()
{
     int answer = foo();
     std::cout << answer << std::endl;
}
