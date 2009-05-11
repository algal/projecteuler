import java.math.BigInteger;

public class prob25 {
    public static void main(String[] args) 
    {
	BigInteger a= BigInteger.valueOf(1);
	BigInteger b = BigInteger.valueOf(1);
	BigInteger counter = BigInteger.valueOf(1);
	
	BigInteger max = (BigInteger.valueOf(10)).pow(999);
	while(true) {
	    BigInteger temp;
	    if(a.compareTo(max) != -1) {
		System.out.println("n=" + counter);
		return;
	    }
	    temp = a;
	    a= b;
	    b= temp.add(b);
	    counter = counter.add(BigInteger.ONE);
	}
    }
}