import static java.lang.System.out;
import java.lang.Integer;
import java.math.BigInteger;

import java.util.Map;
import java.util.HashMap;

public class prob3 
{
    public static void main(String[] args) 
    {
	String n = "600851475143";
	out.println("biggest factor of " + n + " = " + biggestFactor(new BigInteger(n)));

	out.println("factors of " + 12 + " = " + factorInteger(new BigInteger(n)));
    }
    
    /** Returns the largest prime factor of n. 
     *
     * @param n value to be factored
     * @return the largest factor of n
     *
     * 	This function takes [2,3,...,inf] as a list of candidate
     * 	factors, and one by one tries to divide them out of n as many
     * 	times as is possible. Since it tries repeatedly on a factor,
     * 	it will automatically divide out powers of that factor. Thus,
     * 	it will only divide out primes. Since the candidates are
     * 	listed in order, the last factor to divide out successfuly
     * 	will be the highest prime factor of n.
     *
     */
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


    /** Factors n into its prime factors
     *
     * @param n value to be factored
     * @return Map from prime factors to their powers
     *
     */
    public static Map factorInteger(BigInteger n) {
	Map<BigInteger,Integer> factors = new HashMap<BigInteger,Integer>();

	// start trying candidate factors
	for(BigInteger candidate=new BigInteger("2"); 
	    (n.compareTo( BigInteger.ONE ) == 1) 
		&& ((candidate.pow(2)).compareTo( n.pow(2).add(BigInteger.ONE) ) == -1);
	    candidate = candidate.add(BigInteger.ONE)) {

	    // initialise factors to 0
	    if( n.divideAndRemainder( candidate )[1].equals( BigInteger.ZERO ) ) {
		factors.put(candidate,0);
	    }
	    
	    // if candiate is a factor ..
	    while( n.divideAndRemainder( candidate )[1].equals( BigInteger.ZERO ) ) {
		// then factor out all its multiples
		n = n.divideAndRemainder( candidate )[0];
		factors.put(candidate, factors.get(candidate)+1);
	    }
	}
	return factors;
    }
}