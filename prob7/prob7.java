import  static java.lang.System.out;

public class prob7 {
    
    public static boolean isPrime(int n) {
	if(n==1)
	    return false;
	for(int i=2; i < n; ++i) 
	    {
		if( n % i ==0) 
		    return false;
	    }
	return true;
    }
    
    public static void main(String[] args)
    {
	int count=1;
	int n=0;
	while(count<=10001) {
	    ++n;
	    if(!isPrime(n))
		continue;
	    
	    out.println("The " + count++ + "th prime is " + n);
	}
    }
}