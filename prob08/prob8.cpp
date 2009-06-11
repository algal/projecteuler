#include<fstream>
#include<iostream>
#include<vector>
#include<list>

using std::string;
using std::list;
using std::vector;

const string::size_type window_size = 5;

/* Returns product of digits */
unsigned int productDigits(const string & digits) {
  unsigned int product = 1;
  unsigned int digit = 0;
  for(string::const_iterator it = digits.begin(), end = digits.end(); 
      it != end; ++it) {
    // dirty C hack to convert chars to ints
    digit = *it - '0';
    product = product * digit;
  }    

  return product;
}

int main()
{
  std::ifstream f;
  f.open("num.txt");
  if(!f) {
    std::cerr << "Unable to open num.txt";
    exit(1);
  }

  string line;
  string num;
  while(f >> line) {
    num += line;
  }
  
  unsigned int bestProduct = 0;

  for(string::size_type 
	window_begin = 0, 
	max_window_begin = num.size() - window_size;
      window_begin != max_window_begin;
      ++window_begin) {
    const string window = num.substr(window_begin,window_size);
    const unsigned int product = productDigits(window);
    if(product > bestProduct) {
      bestProduct = product;
    }
  }
  
  std::cout << "bestProduct= " << bestProduct << std::endl;

  
}
