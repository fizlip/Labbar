
public class RatNum {
	public static int sgd(int m, int n) {
		
		//m eller n f�r inte vara 0. Kasta ett Exception om s� �r fallet.
		if (m == 0 || n == 0) {
			throw new IllegalArgumentException("Cannot accept m, n = 0");
		}
		
		while (true) {
			//Euklides algoritm f�r st�rsta gemensamma n�mnare. 
			//r = resten, m och n �r de tv� divisorerna
		
			int r = m % n;
			if (r == 0) {
				break;
			}
			else {
				m = n;
				n = r;				
			}
		}
		
		return Math.abs(n);		//Returnera det absoluta v�rdet av resultatet
	}
	
	public static void main(String[] args) {
		System.out.println(sgd(25,13));
	}
}
