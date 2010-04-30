import static java.lang.System.out;
import java.lang.Integer;


public class prob4 {

    public static boolean isPalindrome(int x) {
	String s = Integer.toString(x);
	
	for(int i = 0; i < s.length(); ++i) {
	    if(s.charAt(i) != s.charAt(s.length() -1-i))
		return false;
	}
	return true;
    }

    public static void main(String[] args) {
	int best = 0;
	for(int i = 100; i < 1000; ++i) {
	    for(int j = 1; j < i; ++j) {
		int product = i*j;
		if(isPalindrome(product) == true && product > best)
		    {
			best = product;
			out.println("best so far is " + i + " * " + j + " = " + best);
		    }
	    }
	}      
	
	out.println("overall best = " +best);
    }
}

