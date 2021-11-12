package util;

public class UserObj {
	private String email, name, memberType;
	private int coin;
	
	public UserObj(String email, String name, int coin, String memberType) {
		this.email=email;
		this.name=name;
		this.coin=coin;
		this.memberType=memberType;
	}
	
	public String getEmail() {return this.email;}
	public String getName() {return this.name;}
	public String getMemberType() {return this.memberType;}
	public int getCoin() {return this.coin;}
}
