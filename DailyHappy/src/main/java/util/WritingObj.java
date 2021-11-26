package util;

import java.util.Date;

public class WritingObj {
	private String jarName, content;
	private int no, paperCode;
	private Date ts;
	
	public WritingObj(String jarName, String content, int no, int paperCode, Date ts) {
		this.jarName=jarName;
		this.content=content;
		this.no=no;
		this.paperCode=paperCode;
		this.ts=ts;
	}
	
	public WritingObj(String content, Date ts) {
		this.content=content;
		this.ts=ts;
	}
	
	
	public String getJarName() {return this.jarName;}
	public String getContent() {return this.content;}
	public int getNo() {return this.no;}
	public int getPaperCode() {return this.paperCode;}
	public Date getTs() {return this.ts;}

}
