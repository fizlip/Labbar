
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
		num = x.getNumerator();   // Numerator 
		den = x.getDenominator(); // Denominator
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
	
	public String toString() {
		// Omvandla talet till string
		String numString = Integer.toString(num);
		String denString = Integer.toString(den);
		return (numString + "/" + denString);
	}
	
	public double toDouble() {
		// Omvandla talet till double
		double d = ((double) num) / ((double) den);
		return d;
	}
	
	public static RatNum parse(String s) {
		String[] userString = s.split("/");		// Dela upp str�ngen s� att endast heltalen �r kvar
		int[] userInts = {1,1};					// Array f�r t�ljaren och n�mnaren, initera denna med v�rden 1 f�r f�renkla koden
		RatNum userRatNum = null;				// Det resulterande talet
		
		for(int i = 0; i < userString.length; i++) {
			// Om talet �r negativt g�rs omvandlingen string -> int genom att omvandla nuvarande och n�sta element till ints
			// och sedan s�tta in detta i userInt
			if (userString[i] == "-") {
				int newInt = Integer.parseInt("-" + userString[i+1]);
				userInts[i] = newInt;		// i kommer att korrespondera med indexet i vilken talet ska l�ggas
				i++;
			}
			else {
				// Om talet inte �r negativt g�rs omvandlingen string -> int och resultatet s�tts in i userInt
				int newInt = Integer.parseInt(userString[i]);
				userInts[i] = newInt;
			}
			
		}
		
		userRatNum = new RatNum(userInts[0], userInts[1]);
		return userRatNum;
		
	}
	
}
