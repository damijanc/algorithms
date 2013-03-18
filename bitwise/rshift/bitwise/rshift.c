int main() {
	int i;
	int a;
	int x=1;

	for(i=0; i<1000000000; i++){
            x = x >> 1;
            x = x >> 6;
	}
	return 0;
}
