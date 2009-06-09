#include<sstream>
#include<iostream>

bool isPalindrome(int& x) 
{
  std::ostringstream stream;
  stream << x;
  const std::string s = stream.str();
  
  const int length  = s.length();
  for(int i=0; i < length; ++i)
    {
      if(s[i] != s[length-1-i])
	return false;
    }
  //  std::cout << s << " is a palindrome " << std::endl;
  return true;
}

int main()
{
  int best = 0;
  for(int i = 100; i < 1000; ++i) {
    for(int j = 1; j < i; ++j) {
      int product = i*j;
      if(isPalindrome(product) == true && product > best)
	{
	  best = product;
	  std::cout << "highest palindrome so far is " << i << " * " << j << " = " << best << std::endl;
	}
    }
  }      
  
  std::cout << "highest 3-digit palindrom is best = " << best << std::endl;
}
