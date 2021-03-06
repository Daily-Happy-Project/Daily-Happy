package util;

public class ItemObj {
	private int itemCode, price;
	private String itemName, itemType, info, img1, img2, img3, img4;
	
	public ItemObj(int itemCode, String itemName, String itemType, int price, String info, String img1) {
		this.itemCode=itemCode;
		this.itemName=itemName;
		this.itemType=itemType;
		this.price=price;
		this.info=info;
		this.img1=img1;
	}
	
	public ItemObj(int itemCode, String itemName, String itemType, int price, String info, String img1, String img2, String img3, String img4) {
		this.itemCode=itemCode;
		this.itemName=itemName;
		this.itemType=itemType;
		this.price=price;
		this.info=info;
		this.img1=img1;
		this.img2=img2;
		this.img3=img3;
		this.img4=img4;
	}
	
	
	public int getItemCode() {return this.itemCode;}
	public String getItemName() {return this.itemName;}
	public String getItemType() {return this.itemType;}
	public int getPrice() {return this.price;}
	public String getInfo() {return this.info;}
	public String getImg1() {return this.img1;}
	public String getImg2() {return this.img2;}
	public String getImg3() {return this.img3;}
	public String getImg4() {return this.img4;}
	
}