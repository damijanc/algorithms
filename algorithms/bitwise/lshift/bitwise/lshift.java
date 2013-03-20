public class lshift
{
   public static void main(String args[]) {
		int i;
		int a;
		int x=1;
		for(i=0; i<10000000; i++){
			x = x << 2;
		        x = x << 6;
		}
   }
}

