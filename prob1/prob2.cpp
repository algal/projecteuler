#include<iostream>


int main()
{
  int last=1;
  int current =2;

  int sum=0;
  while( current < 4000000)
    {
      //current is the current value of the sequence
      std::cout << "current = " << current << std::endl;
      
      // add up even values
      if (current % 2 == 0)
	sum+=current;

      // iterate to next value
      int temp = last;
      last = current;
      current = temp + current;
    }

  std::cout << " sum = " << sum << std::endl;
}
