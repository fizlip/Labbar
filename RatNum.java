
public class RatNum {
	// Instans variabler
	// Representera det rationella talet med två heltal som representerar nämnaren och täljaren
	public int num;
	public int den;
	
	
	public RatNum() {
		//Konstruktor utan argument ger ett deafult värde 0/1.
		num = 0;
		den = 1;
	}
	
	
	public RatNum(int a) {
		//Konstruktor med 1 param ger värdet av parametern.
		num = a;
		den = 1;
	}
	
	public RatNum(int a, int b) {
		//Ta emot två parametrar där a är täljaren och b är nämnaren
		if (b == 0) {
			throw new NumberFormatException("Denominator = 0");
		}
		
		int s = sgd(a,b);
		//Förenkla med sgd för att få ratnummret i förenklad form
		num = (a/s);
		den = (b/s);
		if (den < 0) {
			//Omformatera till formen -a/b om nämnaren är mindre än 0
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
		//m eller n får inte vara 0. Kasta ett Exception om så är fallet.
		if (n == 0) {
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
		
		return Math.abs(n);		//Returnera en positiv faktor
	}
	
}
