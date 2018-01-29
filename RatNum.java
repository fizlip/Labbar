
public class RatNum {
	public static int sgd(int m, int n) {
		
		//m eller n får inte vara 0. Kasta ett Exception om så är fallet.
		if (m == 0 || n == 0) {
			throw new IllegalArgumentException("Cannot accept m, n = 0");
		}
		
		while (true) {
			//Euklides algoritm för största gemensamma nämnare. 
			//r = resten, m och n är de två divisorerna
		
			int r = m % n;
			if (r == 0) {
				break;
			}
			else {
				m = n;
				n = r;				
			}
		}
		
		return Math.abs(n);		//Returnera det absoluta värdet av resultatet
	}
	
	public static void main(String[] args) {
		System.out.println(sgd(25,13));
	}
}
