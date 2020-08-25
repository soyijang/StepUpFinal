package com.stepup.agile.userMyTasks.model.vo;


public class Rss implements java.io.Serializable{
	private int rssCode;
	private int userProjectCode;
	private String rssYn;
	
	public Rss() {}
	
	public Rss(int rssCode, int userProjectCode, String rssYn) {
		super();
		this.rssCode = rssCode;
		this.userProjectCode = userProjectCode;
		this.rssYn = rssYn;
	}
	
	public int getRssCode() {
		return rssCode;
	}
	public void setRssCode(int rssCode) {
		this.rssCode = rssCode;
	}
	public int getUserProjectCode() {
		return userProjectCode;
	}
	public void setUserProjectCode(int userProjectCode) {
		this.userProjectCode = userProjectCode;
	}
	public String getRssYn() {
		return rssYn;
	}
	public void setRssYn(String rssYn) {
		this.rssYn = rssYn;
	}
	
	@Override
	public String toString() {
		return "Rss [rssCode=" + rssCode + ", userProjectCode=" + userProjectCode + ", rssYn=" + rssYn + "]";
	}

	
}
