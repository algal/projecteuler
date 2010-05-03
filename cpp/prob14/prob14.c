#include <stdio.h> 

int main(int argc, char **argv) 
{ 
  int longest_start = 0; 
  int terms = 0; 
  int i; 
  unsigned long j; 
  
  for (i = 1; i <= 1000000; i++) { 
      j = i; 
      int this_length = 1; 
      
      while (j != 1) { 
	this_length++; 
	
	if (this_length > terms) { 
	  terms = this_length; 
	  longest_start = i; 
	} 
	
	if (j % 2 == 0) { 
	  j = j / 2; 
	} 
	else { 
	  j = 3 * j + 1; 
	} 
      } 
  } 
  
  printf("longest: %d (%d)\n", longest_start, terms); 
  return 0; 
}
