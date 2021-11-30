package util;

import java.sql.Timestamp;
import java.util.Date;

public class WritingObj {
	private String jarName, content;
	private int no, paperCode;
	private Timestamp ts;
	
	public WritingObj(String jarName, String content, int no, int paperCode, Timestamp ts) {
		this.jarName=jarName;
		this.content=content;
		this.no=no;
		this.paperCode=paperCode;
		this.ts=ts;
	}
	
	public WritingObj(int no, String content, int paperCode, Timestamp ts) {
		this.no=no;
		this.content=content;
		this.paperCode=paperCode;
		this.ts=ts;
	}
	
	
	public String getJarName() {return this.jarName;}
	public String getContent() {return this.content;}
	public int getNo() {return this.no;}
	public int getPaperCode() {return this.paperCode;}
	public Timestamp getTs() {return this.ts;}

}
