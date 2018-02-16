import java.util.Random;
import java.util.Arrays;


public class Tools {

	public static void randomOrder(Object[] objectArray) {
		Random rand = new Random();
		int[] randArray = new int[objectArray.length];
		
		for (int i = 0; i < objectArray.length; i++) {
			int j = rand.nextInt(objectArray.length);
			Object elementI = objectArray[i];
			
			Arrays.fill(objectArray,i, i+1, objectArray[j]);
			Arrays.fill(objectArray,j, j+1, elementI);
			
			}
	}	
}
