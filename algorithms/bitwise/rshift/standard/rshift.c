int main() {
	int x=1;
	int i;
	for(i=0; i<100000000; i++){
		x = x / 2;
		x = x / 64;
	}
	return 0;
}
