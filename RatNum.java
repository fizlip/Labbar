
public class RatNum {
	// Instans variabler
	// Representera det rationella talet med tv� heltal som representerar n�mnaren och t�ljaren
	public int num;
	public int den;
	
	
	public RatNum() {
		//Konstruktor utan argument ger ett deafult v�rde 0/1.
		num = 0;
		den = 1;
	}
	
	
	public RatNum(int a) {
		//Konstruktor med 1 param ger v�rdet av parametern.
		num = a;
		den = 1;
	}
	
	public RatNum(int a, int b) {
		//Ta emot tv� parametrar d�r a �r t�ljaren och b �r n�mnaren
		if (b == 0) {
			throw new NumberFormatException("Denominator = 0");
		}
		
		int s = sgd(a,b);
		//F�renkla med sgd f�r att f� ratnummret i f�renklad form
		num = (a/s);
		den = (b/s);
		if (den < 0) {
			//Omformatera till formen -a/b om n�mnaren �r mindre �n 0
			num = -num;
			den = -den;
		}
		
	}
	
	public RatNum(RatNum x) {
		//Kopiera det givna rationella talet
		num = x.getNumerator();
		den = x.getDenominator();
	}
	
	public int getNumerator() {
		return num;
	}
	
	public int getDenominator() {
		return den;
	}
	
	public static int sgd(int m, int n) {
		//m eller n f�r inte vara 0. Kasta ett Exception om s� �r fallet.
		if (n == 0) {
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
		
		return Math.abs(n);		//Returnera en positiv faktor
	}
	
}
