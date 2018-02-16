import java.io.File;
import java.util.Arrays;

import javax.swing.*;
import java.awt.*;
import javax.swing.border.*;
import javax.swing.*;
import java.awt.event.*;

public class Memory extends JFrame implements ActionListener {
	
	private File[] pictures;
	private ImageIcon[] icons;
	
	public Memory() {
		
		//Hämta bilderna från filen CardImages som antas finnas i samma mapp som Memory
		File folder = new File("CardImages");
		pictures = folder.listFiles();
		
		//Skapa listan av bilder från den givna filen
		icons = new ImageIcon[pictures.length];
		
		for(int i = 0; i < pictures.length; i++) {
			//För varje fil i pictures-arrayen får 'pathen' och ett Icon object skapas med ImageIcon.
			icons[i] = new ImageIcon(pictures[i].getPath()); 
		}
	}
	
	public Card[] createCards(int n) {
		//Skapa spelplanen med en slumpmässig array av kort med längden n
		ImageIcon[] gameImages = Arrays.copyOf(icons, n/2);	// Skapa kopia av bilderna
		Card[] cards = new Card[n];			//Initiera en lista med card objekt
		
		
		Tools.randomOrder(gameImages);					
		for (int i = 0; i < gameImages.length; i++) {
			//Initera kort och skapa par av bilderna
			cards[i] = new Card(gameImages[i], Card.Status.HIDDEN);		//Skapa instanser av Card objektet
			}
		
		for (int i = n/2; i < cards.length; i++) {
			cards[i] = new Card(cards[i - n/2].image, Card.Status.HIDDEN);
			
		}
		
		Tools.randomOrder(cards);
		return cards;
		}
	
	public void newGame() {
		int rows = 0, cols = 0;
		
		//Fråga efter kolumner och rader
		rows = Integer.parseInt(JOptionPane.showInputDialog("Hur många rader?"));
		cols = Integer.parseInt(JOptionPane.showInputDialog("Hur många Kolumner?"));
		
		//Hantera felaktiga värden
		if (rows*cols > 36) {
			String toManyPicturesRequested = "Kan inte finnas fler än 36 bilder.\nFörsök igen." ;
			JOptionPane.showMessageDialog(null, toManyPicturesRequested);
			newGame();
		}
		if (rows*cols == 1 || rows*cols == 0) {
			String toFewPicturesReqeusted = "Måste finnas mer än en rad och en kolumn.\nFörsök igen.";
			JOptionPane.showMessageDialog(null, toFewPicturesReqeusted);;
			newGame();
		}
		
		//Skapa spelplan
		
		
		//Layouts
		GridLayout cardLayout = new GridLayout(0, cols);	// Layout för korten
		GridLayout otherButtonLayout = new GridLayout(1,2);	// Layout för knappar för nytt spel och avslut
		
		// Kort och knappar är två olika JPanels
		JPanel otherButtons = new JPanel();
		JPanel cardButtons = new JPanel();
		
		// Skapa spelplanen med givna layouts
		Container c = getContentPane();
		cardButtons.setLayout(cardLayout);
		otherButtons.setLayout(otherButtonLayout);
		
		// Placera ut korten på cardButtons och lägg till en actionListener som byter status
		// från HIDDEN till VISIBLE på kortet som har blivit nedtryckt.
		Card[] cards = createCards(rows*cols);
		EtchedBorder e = new EtchedBorder();

		for(Card card : cards) {
			// Skapa en actionListener för varje kort i cards och lägg till detta kort i cardButtons.
			card.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					card.setStatus(Card.Status.VISIBLE);
				}
				
			});
			cardButtons.add(card);
			card.setBorder(e);
		}
		
		// Skapa knappar för nytt parti och avslut
		JButton playAgain = new JButton("Nytt Parti");
		JButton exit = new JButton("Avsluta");
		exit.addActionListener(this);
		playAgain.addActionListener(this);
		
		//Lägg till knaparna till otherButtons panelen
		otherButtons.add(playAgain);
		otherButtons.add(exit);
		playAgain.setBorder(e);
		exit.setBorder(e);
	
		//Lägg slutligen till card buttons och otherButtons till containern för att slutföra konstruktionen av speplanen
		c.add(cardButtons);
		c.add(otherButtons, BorderLayout.SOUTH);
		
		// Stilistiska ändringar och gör planen synlig samt avsluta programet på rätt sätt
		otherButtonLayout.setHgap(10);
		setSize(500, 500);
		setVisible(true);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		
		
	}
	
	
	public void actionPerformed(ActionEvent e) {
		// Om användaren trycker på "Avsluta" så stängs programmet ner.
		if (e.getActionCommand() == "Avsluta") {
			System.exit(0);
		}
		// Om användaren trycker på "Nytt Parti" så stängs fönstret ner och ett nytt spel påbörjas.
		else if (e.getActionCommand() == "Nytt Parti") {
			dispose();
			Memory newG = new Memory();
			newG.newGame();
		}
	}
	
	
	public static void main(String[] args) {
		Memory game = new Memory();
		game.newGame();
	}
}
