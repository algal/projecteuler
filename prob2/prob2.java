import static java.lang.System.out;

public class prob2 {

    public static void main(String[] args) {
  int last=1;
  int current =2;

  int sum=0;
  while( current < 4000000)
    {
      //current is the current value of the sequence
	System.out.println(" current = " + current);
      
      // add up even values
      if (current % 2 == 0)
	sum+=current;

      // iterate to next value
      int temp = last;
      last = current;
      current = temp + current;
    }


  out.println(" sum = " + sum);	



    }


}