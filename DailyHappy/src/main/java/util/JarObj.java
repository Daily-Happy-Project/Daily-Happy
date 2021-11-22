package util;

public class JarObj {
	private String jarName, foldMethod;
	private int cnt, goalNum;
	
	public JarObj(String jarName, int cnt, int goalNum) {
		this.jarName=jarName;
		this.cnt=cnt;
		this.goalNum=goalNum;
	}
	public JarObj(String jarName, String foldMethod, int cnt, int goalNum) {
		this.jarName=jarName;
		this.foldMethod=foldMethod;
		this.cnt=cnt;
		this.goalNum=goalNum;
	}
	
	public String getJarName() {return this.jarName;}
	public String getFoldMethod() {return this.foldMethod;}
	public int getCnt() {return this.cnt;}
	public int getGoalNum() {return this.goalNum;}
}
