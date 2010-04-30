#include<iostream>
//
// broken. Must find a biginteger class first
//
int main() 
{
  long a=1;
  long b=1;
  long counter=1;
  while(true) {
    int temp;
    if(a >= 10 ^ 999) {
      std::cout << "n=" << counter << std::endl;
      return;
    }
    temp =a;
    a=b;
    b= temp+b;
    counter++;
  }

}
