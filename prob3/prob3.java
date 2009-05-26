import static java.lang.System.out;
import java.math.BigInteger;

import java.util.Map;
import java.util.HashMap;

public class prob3 
{
    public static void main(String[] args) 
    {
	String n = "600851475143";
	out.println("biggest factor of " + n + " = " + biggestFactor(new BigInteger(n)));
    }
    
    public static BigInteger biggestFactor(BigInteger n) 
    {
	// the largest factor so far
	BigInteger factor = BigInteger.ONE;
	
	// a candidate factor
	BigInteger candidate = (BigInteger.ONE).add( BigInteger.ONE );
	
	// as long as n is not completely factored ...
	while(n.compareTo(BigInteger.ONE) == 1) {
	    // ... try our next candidate factor
	    if(n.divideAndRemainder(candidate)[1].equals(BigInteger.ZERO)) {
		// if it is a factor, remember it as the highest so far,
		factor = candidate;
		
		//  and divide it out of n
		n = n.divideAndRemainder(factor)[0];
		while(n.divideAndRemainder(factor)[1].equals(BigInteger.ZERO)) {
		    n = n.divideAndRemainder(factor)[0];
		}
	    }
	    // then prepare to try the next highest factor
	    candidate = candidate.add(BigInteger.ONE);
	}
	return factor;
    }
}