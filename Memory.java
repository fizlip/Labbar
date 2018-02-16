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
		
		//H�mta bilderna fr�n filen CardImages som antas finnas i samma mapp som Memory
		File folder = new File("CardImages");
		pictures = folder.listFiles();
		
		//Skapa listan av bilder fr�n den givna filen
		icons = new ImageIcon[pictures.length];
		
		for(int i = 0; i < pictures.length; i++) {
			//F�r varje fil i pictures-arrayen f�r 'pathen' och ett Icon object skapas med ImageIcon.
			icons[i] = new ImageIcon(pictures[i].getPath()); 
		}
	}
	
	public Card[] createCards(int n) {
		//Skapa spelplanen med en slumpm�ssig array av kort med l�ngden n
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
		
		//Fr�ga efter kolumner och rader
		rows = Integer.parseInt(JOptionPane.showInputDialog("Hur m�nga rader?"));
		cols = Integer.parseInt(JOptionPane.showInputDialog("Hur m�nga Kolumner?"));
		
		//Hantera felaktiga v�rden
		if (rows*cols > 36) {
			String toManyPicturesRequested = "Kan inte finnas fler �n 36 bilder.\nF�rs�k igen." ;
			JOptionPane.showMessageDialog(null, toManyPicturesRequested);
			newGame();
		}
		if (rows*cols == 1 || rows*cols == 0) {
			String toFewPicturesReqeusted = "M�ste finnas mer �n en rad och en kolumn.\nF�rs�k igen.";
			JOptionPane.showMessageDialog(null, toFewPicturesReqeusted);;
			newGame();
		}
		
		//Skapa spelplan
		
		
		//Layouts
		GridLayout cardLayout = new GridLayout(0, cols);	// Layout f�r korten
		GridLayout otherButtonLayout = new GridLayout(1,2);	// Layout f�r knappar f�r nytt spel och avslut
		
		// Kort och knappar �r tv� olika JPanels
		JPanel otherButtons = new JPanel();
		JPanel cardButtons = new JPanel();
		
		// Skapa spelplanen med givna layouts
		Container c = getContentPane();
		cardButtons.setLayout(cardLayout);
		otherButtons.setLayout(otherButtonLayout);
		
		// Placera ut korten p� cardButtons och l�gg till en actionListener som byter status
		// fr�n HIDDEN till VISIBLE p� kortet som har blivit nedtryckt.
		Card[] cards = createCards(rows*cols);
		EtchedBorder e = new EtchedBorder();

		for(Card card : cards) {
			// Skapa en actionListener f�r varje kort i cards och l�gg till detta kort i cardButtons.
			card.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					card.setStatus(Card.Status.VISIBLE);
				}
				
			});
			cardButtons.add(card);
			card.setBorder(e);
		}
		
		// Skapa knappar f�r nytt parti och avslut
		JButton playAgain = new JButton("Nytt Parti");
		JButton exit = new JButton("Avsluta");
		exit.addActionListener(this);
		playAgain.addActionListener(this);
		
		//L�gg till knaparna till otherButtons panelen
		otherButtons.add(playAgain);
		otherButtons.add(exit);
		playAgain.setBorder(e);
		exit.setBorder(e);
	
		//L�gg slutligen till card buttons och otherButtons till containern f�r att slutf�ra konstruktionen av speplanen
		c.add(cardButtons);
		c.add(otherButtons, BorderLayout.SOUTH);
		
		// Stilistiska �ndringar och g�r planen synlig samt avsluta programet p� r�tt s�tt
		otherButtonLayout.setHgap(10);
		setSize(500, 500);
		setVisible(true);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		
		
	}
	
	
	public void actionPerformed(ActionEvent e) {
		// Om anv�ndaren trycker p� "Avsluta" s� st�ngs programmet ner.
		if (e.getActionCommand() == "Avsluta") {
			System.exit(0);
		}
		// Om anv�ndaren trycker p� "Nytt Parti" s� st�ngs f�nstret ner och ett nytt spel p�b�rjas.
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
