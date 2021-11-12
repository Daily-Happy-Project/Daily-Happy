package dto;

public class StoreDTO {
	//상점 - 색종이 
	private String paperName;
	private int sprice;
	private String sinfo;
	private String paperImg;
	
	//상점 - 테마
	private String themeName;
	private int tprice;
	private String tinfo;
	private String themeImg;
	
	//상점 - 유리병 
	private String jarName;
	private int jprice;
	private String jinfo;
	private String jarImg;
	
	//상점 - 도안 
	private String foldmethodName;
	private int fprice;
	private String finfo;
	private String foldmethodImg;
	
	//색종이 
	public String getPaperName() {
		return paperName;
	}
	public void setPaperName(String paperName) {
		this.paperName=paperName;
	}
	public int getSprice() {
		return sprice;
	}
	public void setSprice(int sprice) {
		this.sprice=sprice;
	}
	public String getSinfo() {
		return sinfo;
	}
	public void setSinfo(String sinfo) {
		this.sinfo=sinfo;
	}
	public String getPaperImg() {
		return paperImg;
	}
	public void setPaperImg(String paperImg) {
		this.paperImg=paperImg;
	}
	
	
	//테마 
	public String getThemeName() {
		return themeName;
	}
	public void setThemeName(String themeName) {
		this.themeName=themeName;
	}
	public int getTprice() {
		return tprice;
	}
	public void setTprice(int tprice) {
		this.tprice=tprice;
	}
	public String getTinfo() {
		return tinfo;
	}
	public void setTinfo(String tinfo) {
		this.tinfo=tinfo;
	}
	public String getThemeImg() {
		return themeImg;
	}
	public void setThemeImg(String themeImg) {
		this.themeImg=themeImg;
	}
	
	
	//유리병 
	public String getJarName() {
		return jarName;
	}
	public void setJarName(String jarName) {
		this.jarName=jarName;
	}
	public int getJprice() {
		return jprice;
	}
	public void setJprice(int jprice) {
		this.jprice=jprice;
	}
	public String getJinfo() {
		return jinfo;
	}
	public void setJinfo(String jinfo) {
		this.jinfo=jinfo;
	}
	public String getJarImg() {
		return jarImg;
	}
	public void setJarImg(String jarImg) {
		this.jarImg=jarImg;
	}
	
	
	//도안 
	public String getFoldmethodName() {
		return foldmethodName;
	}
	public void setFoldmethodName(String foldmethodName) {
		this.foldmethodName=foldmethodName;
	}
	public int getFprice() {
		return fprice;
	}
	public void setFprice(int fprice) {
		this.fprice=fprice;
	}
	public String getFinfo() {
		return finfo;
	}
	public void setFinfo(String finfo) {
		this.finfo=finfo;
	}
	public String getFoldmethodImg() {
		return foldmethodImg;
	}
	public void setFoldmethodImg(String foldmethodImg) {
		this.foldmethodImg=foldmethodImg;
	}
}
