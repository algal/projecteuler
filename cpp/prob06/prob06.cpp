#include <iostream>

int main()
{
     int sumofsquares=0;
     for(int i=1; i<101; ++i)
     {
	  sumofsquares += i*i;
     }

     int squareofsums=0;
     for(int i=1; i<101; ++i) 
     {
	  squareofsums += i;
     }
     squareofsums = squareofsums * squareofsums;

     int difference = squareofsums - sumofsquares;

     std::cout << "sum of squares = " << sumofsquares << std::endl
	       << "square of sums = " << squareofsums << std::endl
	       << "difference = " << difference << std::endl;
}
