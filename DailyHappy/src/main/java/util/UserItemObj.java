package util;

public class UserItemObj {
	private int itemCode;
	private String itemName;
	private String img1;
	
	public UserItemObj(int itemCode, String itemName, String img1) {
		this.itemCode=itemCode;
		this.itemName=itemName;
		this.img1=img1;
	}	
	public UserItemObj(int itemCode, String img1) {
		this.itemCode=itemCode;
		this.img1=img1;
	}
	
	public int getItemCode() {return this.itemCode;}
	public String getItemName() {return this.itemName;}
	public String getImg() {return this.img1;}
	
}

	
	
