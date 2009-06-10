import java.util.Arrays;

public class prob10 {

    public static final int MAX = 2000000;

    /** Sieves to find all primes up to n.

	@param maximum number
	@return a boolean[], where a[i] tells if i is prime 
    */
    public static boolean[] sieve(int n) 
    {
	boolean[] primes = new boolean[n];
	boolean[] visited = new boolean[n];

	Arrays.fill(primes,false);
	Arrays.fill(visited,false);

	primes[0]=false;
	primes[1]=false;
	// iterate thru every number
	for(int i=2; i < n; ++i) {
	    if(visited[i]==true)
		continue;
	    // mark it as prime
	    primes[i]=true;
	    // mark all its multiples as non-prime
	    for(int j=(i+i); j < n; j=j+i) {
		primes[j]=false;
		visited[j]=true;
	    }
	}
	return primes;
    }

    public static void main(String[] args) {
	boolean[] primes = sieve(MAX);

	long sum = 0;
	for(int i=1; i < MAX; ++i) {
	    if(primes[i] == true)
		sum += i;
	}
	System.out.println("The primes up to " + MAX + " sum to " + sum);

	int count=1;
	int i =1;
	while(count < 1000) {
	    if(primes[i] ==true)
		{
		    System.out.println("The "+ count++ +"th prime is " + i);
		}
	    i++;
	}
    }
}