package util;

public class JarObj {
<<<<<<< HEAD
	private String jarName, jarItemName, jarImgName, foldMethodName;
=======
	private String jarName, foldMethod;
>>>>>>> main
	private int cnt, goalNum;
	
	public JarObj(String jarName, int cnt, int goalNum) {
		this.jarName=jarName;
		this.cnt=cnt;
		this.goalNum=goalNum;
	}
<<<<<<< HEAD
	public JarObj(String jarName, String jarImgName, int cnt, int goalNum) {
		this.jarName=jarName;
		this.jarImgName=jarImgName;
		this.cnt=cnt;
		this.goalNum=goalNum;
	}
	public JarObj(String jarName, String jarImgName, int cnt, int goalNum, String jarItemName, String foldMethodName) {
		this.jarName=jarName;
		this.jarImgName=jarImgName;
		this.cnt=cnt;
		this.goalNum=goalNum;
		this.jarItemName=jarItemName;
		this.foldMethodName=foldMethodName;
	}
	
	public String getJarName() {return this.jarName;}
	public String getJarItemName() {return this.jarItemName;}
	public String getJarImgName() {return this.jarImgName;}
	public String getFoldMethodName() {return this.foldMethodName;}
	public int getCnt() {return this.cnt;}
	public int getGoalNum() {return this.goalNum;}
}

=======
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
>>>>>>> main
