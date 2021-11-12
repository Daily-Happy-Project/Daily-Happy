package dto;

public class UserDTO {
	private String email;
	private String name;
	private String pw;
	private int coin;
	
	public int getCoin() { //코인 얻음 
		return coin;
	}
	public void setCoin(int coin) { //코인 모음 
		this.coin=coin;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email=email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name=name;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw=pw;
	}
}
