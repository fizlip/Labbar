
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
		String[] userString = s.split("/");		// Dela upp strängen så att endast heltalen är kvar
		int[] userInts = {1,1};					// Array för täljaren och nämnaren, initera denna med värden 1 för förenkla koden
		RatNum userRatNum = null;				// Det resulterande talet
		
		for(int i = 0; i < userString.length; i++) {
			// Om talet är negativt görs omvandlingen string -> int genom att omvandla nuvarande och nästa element till ints
			// och sedan sätta in detta i userInt
			if (userString[i] == "-") {
				int newInt = Integer.parseInt("-" + userString[i+1]);
				userInts[i] = newInt;		// i kommer att korrespondera med indexet i vilken talet ska läggas
				i++;
			}
			else {
				// Om talet inte är negativt görs omvandlingen string -> int och resultatet sätts in i userInt
				int newInt = Integer.parseInt(userString[i]);
				userInts[i] = newInt;
			}
			
		}
		
		userRatNum = new RatNum(userInts[0], userInts[1]);
		return userRatNum;
		
	}
	
}
