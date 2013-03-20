using System;

public class rshift
{
	
   public static void Main() {
		int i;
		int a=1;
		for(i=0; i<10000000; i++){
                       a=1;
			a = a / 2;
			a = a / 64;
		}
   }
}

