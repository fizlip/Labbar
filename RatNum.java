import java.util.Arrays;

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
		
		// Ta hand om gr�nsfall d�r t�ljaren �r 0 s� att inte sgd 
		//felmeddelande upptst�r.
		if (a == 0) {
			num = 0; den = b;
		}
		else {
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
		
		return Math.abs(n);		//Returnera en positiv faktor
	}
	
	public String toString() {
		// om
		if (den >= Math.abs(num)) {
			String numString = Integer.toString(num);
			String denString = Integer.toString(den);
			return (numString + "/" + denString);
		}
		else {
			int factor = num / den; //Heltalsdel
			String numString = Integer.toString(Math.abs((num - (factor * den)))); // N�mnare utan heltalsdel
			String denString = Integer.toString(Math.abs(den));
			String factorString = Integer.toString(factor);
			return (factorString + " " + numString + "/" + denString);
		}
	}
	
	public Double toDouble() {
		// Omvandla talet till double
		Double d = new Double((double) num) / ((double) den);
		return d;
	}
	
	public static RatNum parse(String s) {
		String[] userString = s.split("/");		// Dela upp str�ngen s� att endast heltalen �r kvar
		int[] userInts = {1,1};					// Array f�r t�ljaren och n�mnaren, initera denna med v�rden 1 f�r f�renkla koden
		RatNum userRatNum = null;				// Det resulterande talet
		
		for(int i = 0; i < userString.length; i++) {
			// Om talet inte �r negativt g�rs omvandlingen string -> int och resultatet s�tts in i userInt
			int newInt = Integer.parseInt(userString[i]);
			userInts[i] = newInt;
		}
		
		if (userInts.length > 2) {
			throw (new IllegalArgumentException ("Input in form a/b/c"));
		}
		
		userRatNum = new RatNum(userInts[0], userInts[1]);
		return userRatNum;
		
	}
	
	public RatNum(String s) {
		this(parse(s));
	}
	
	public Object clone() {
		//Klona ett ett ratNum objekt
		return new RatNum(num, den);
	}
	
	public boolean equals(RatNum r) {
		// Best�m om argumentet �r lika med denna instans av ratNum
		return (den == r.getDenominator() && num == r.getNumerator());
	}
	
	public boolean lessThan(RatNum r) {
		// Bet�m om argumentet �r mindre �n nuvarande ratnum
		return (toDouble() < r.toDouble());
	}
	
	public RatNum add(RatNum r) {
		// L�gg till r
		int newNum = r.den*num + den*r.num;
		int newDen = r.den*den;
		return new RatNum(newNum, newDen);
	}
	
	public RatNum sub(RatNum r) {
		// Ta bort r
		int newNum = r.den*num - den*r.num;
		int newDen = r.den*den;
		RatNum m = new RatNum(newNum, newDen);
		return new RatNum(newNum, newDen);
	}
	
	public RatNum mul(RatNum n) {
		// Multiplicera med r
		int newNum = num * n.num;
		int newDen = den * n.den;
		return new RatNum(newNum, newDen);
	}
	
	public RatNum div(RatNum n) {
		// Dividera mer r
		int newNum = num * n.den;
		int newDen = den * n.num;
		return new RatNum(newNum, newDen);
	}
	
	
}
