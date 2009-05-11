import java.util.Arrays;

public class prob10 {

    public static final int MAX = 2000000;

    public static void main(String[] args) {
	boolean[] primes = new boolean[MAX];
	boolean[] visited = new boolean[MAX];

	Arrays.fill(primes,false);
	Arrays.fill(visited,false);

	long sum = 0;

	primes[0]=false;
	primes[1]=false;
	// iterate thru every number
	for(int i=2; i < MAX; ++i) {
	    if(visited[i]==true)
		continue;
	    // mark it as prime
	    primes[i]=true;
	    sum += i;
	    // mark all its multiples as non-prime
	    for(int j=(i+i); j < MAX; j=j+i) {
		primes[j]=false;
		visited[j]=true;
	    }
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