package dto;

import java.util.Date;

public class UserDTO {
	private String email;
	private String name;
	private String pw;
	private int coin;
	private int userThemeCode;
	private Date join_date;
	
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
	public int getUserThemeCode() {
		return userThemeCode;
	}
	public void setUserThemeCode(int userThemeCode) {
		this.userThemeCode=userThemeCode;
	}
	
	public void setJoin_date(Date join_date) {
		this.join_date=join_date;
	}
	
}
