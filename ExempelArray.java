class ExempelArray {

    public static void flerdimensionell(){
        int[][] x = {{1, 7}, {7, 6}, {0, 3}};
        int[][] y = {{8, 3}, {2, 5}, {1, 7}};
        int[][] z = new int[x.length][x[0].length];

        System.out.println("Två " + x.length + "x" + x[0].length + " arrayer");

        // OBS! Detta funkar bara om vi vet att x och y har samma dimensioner!
        for (int i = 0; i < x.length; i++) {
            for (int j = 0; j < x[0].length; j++) {
                z[i][j] = x[i][j] + y[i][j];
            }
        }
      }
  // En array med jämna tal med längd l.
  public static void init(int l){
    int [] xs = new int[l];
    for (int i = 0; i < xs.length; i++){ // OBS! index börjar på 0.
        xs[i] = 2*(i+1);         // Initiera till jämna tal, större än 0.
      }
    // Man kan direkt kolla upp ett värde mitt i en array, till skillnad mot
    // t.ex. listor i Haskell där man måste gå igenom listan steg för steg.
    int mitten = xs[l/2];

    for (int j = 0; j < xs.length; j++){
      System.out.println(xs[j]);
    }
  }

  public static void main(String [] args) {
      /*int [] a = {1,2,3,4}; // Initera med explicita värden
      boolean [] b = new boolean[4]; //Initiera med enbart längd + förvalda värden för typen.
      // Vad gör loopen?
      for (int j = 0; j < b.length; j++){
        System.out.println(a[j] +" "+ b[j]);
      } */
      init(100);
      flerdimensionell();
  }

}
