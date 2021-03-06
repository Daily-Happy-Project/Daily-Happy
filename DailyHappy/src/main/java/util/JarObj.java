package util;

public class JarObj {
	private String jarName, jarItemName, jarImgName, foldMethodName;
	private int cnt, goalNum;
	private boolean shareState;
	
	public JarObj(String jarName, int cnt, int goalNum) {
		this.jarName=jarName;
		this.cnt=cnt;
		this.goalNum=goalNum;
	}
	public JarObj(String jarName, String jarImgName, int cnt, int goalNum) {
		this.jarName=jarName;
		this.jarImgName=jarImgName;
		this.cnt=cnt;
		this.goalNum=goalNum;
	}
	public JarObj(String jarName, String jarImgName, int cnt, int goalNum, String jarItemName, String foldMethodName, boolean shareState) {
		this.jarName=jarName;
		this.jarImgName=jarImgName;
		this.cnt=cnt;
		this.goalNum=goalNum;
		this.jarItemName=jarItemName;
		this.foldMethodName=foldMethodName;
		this.shareState=shareState;
	}
	
	public String getJarName() {return this.jarName;}
	public String getJarItemName() {return this.jarItemName;}
	public String getJarImgName() {return this.jarImgName;}
	public String getFoldMethodName() {return this.foldMethodName;}
	public int getCnt() {return this.cnt;}
	public int getGoalNum() {return this.goalNum;}
	public boolean getShareState() {return this.shareState;}
}

