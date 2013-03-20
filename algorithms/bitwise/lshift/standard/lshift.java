public class lshift
{
	
   public static void main(String args[]) {
		int i;
		int a=1;
		for(i=0; i<10000000; i++){
			a = a * 2;
			a = a * 64;
		}
   }
}

