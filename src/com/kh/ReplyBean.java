package com.kh;

public class ReplyBean {
	private int num;
	private int borNum;
	private String memId;
	private String content;
	private String redate;
	
	public ReplyBean() {
		
	}
	
	public ReplyBean(int num, int borNum, String memId, String content, String redate) {
		this.num = num;
		this.borNum = borNum;
		this.memId = memId;
		this.content = content;
		this.redate = redate;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getBorNum() {
		return borNum;
	}
	public void setBorNum(int borNum) {
		this.borNum = borNum;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRedate() {
		return redate;
	}
	public void setRedate(String redate) {
		this.redate = redate;
	}
	
	
	
}
