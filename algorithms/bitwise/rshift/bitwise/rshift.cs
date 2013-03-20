using System;

public class rshift {

static public void Main () {
	Console.WriteLine("Hello from mono");	
	int i;
	int x=1;
	for(i=0; i<10000000; i++){
			x = x >> 1;
            x = x >> 6;
		}
	}
}


