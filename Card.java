import java.awt.Color;

import javax.swing.*;

public class Card extends JButton{
	
	public enum Status {HIDDEN, MISSING, VISIBLE} 
	public Status status;
	public Icon image;
	
	public Card(Icon i) {
		this.status = Card.Status.MISSING;
		this.image = i;
		createCard();
	}
	
	public Card(Icon i, Status s) {
		this.status = s;
		this.image = i;
		createCard();
	}
	
	public void setStatus(Status newStatus) {
		this.status = newStatus;
		createCard();
	}
	
	public Status getStatus() {
		return status;
	}
	
	public boolean sameIcon(Card c) {
		if(image == c.image) {
			return true;
		}
		return false;
	}
	
	private void createCard() {
		if (status == Card.Status.HIDDEN) {
			this.setBackground(Color.blue);
		}
		else if (status == Card.Status.MISSING){
			this.setBackground(Color.white);
		}
		else{
			this.setIcon(image);
		}
	}
	
}
