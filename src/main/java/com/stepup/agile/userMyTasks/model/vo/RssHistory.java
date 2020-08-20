package com.stepup.agile.userMyTasks.model.vo;


public class RssHistory implements java.io.Serializable {

	private int rssHistoryCode;
	private String rssModifyDate;
	private String rssModifyTime;
	private String rssModifyType;
	private String rssModifyNickname;
	private int rssCode;
	private String rssModifyKeyword;
	private String rssModifyUrl;
	private String rssModifySite;
	
	public RssHistory() {}
	
	public RssHistory(int rssHistoryCode, String rssModifyDate, String rssModifyTime, String rssModifyType,
			String rssModifyNickname, int rssCode, String rssModifyKeyword, String rssModifyUrl, String rssModifySite) {
		super();
		this.rssHistoryCode = rssHistoryCode;
		this.rssModifyDate = rssModifyDate;
		this.rssModifyTime = rssModifyTime;
		this.rssModifyType = rssModifyType;
		this.rssModifyNickname = rssModifyNickname;
		this.rssCode = rssCode;
		this.rssModifyKeyword = rssModifyKeyword;
		this.rssModifyUrl = rssModifyUrl;
		this.rssModifySite = rssModifySite;
	}
	
	public int getRssHistoryCode() {
		return rssHistoryCode;
	}
	public void setRssHistoryCode(int rssHistoryCode) {
		this.rssHistoryCode = rssHistoryCode;
	}
	public String getRssModifyDate() {
		return rssModifyDate;
	}
	public void setRssModifyDate(String rssModifyDate) {
		this.rssModifyDate = rssModifyDate;
	}
	public String getRssModifyTime() {
		return rssModifyTime;
	}
	public void setRssModifyTime(String rssModifyTime) {
		this.rssModifyTime = rssModifyTime;
	}
	public String getRssModifyType() {
		return rssModifyType;
	}
	public void setRssModifyType(String rssModifyType) {
		this.rssModifyType = rssModifyType;
	}
	public String getRssModifyNickname() {
		return rssModifyNickname;
	}
	public void setRssModifyNickname(String rssModifyNickname) {
		this.rssModifyNickname = rssModifyNickname;
	}
	public int getRssCode() {
		return rssCode;
	}
	public void setRssCode(int rssCode) {
		this.rssCode = rssCode;
	}
	public String getRssModifyKeyword() {
		return rssModifyKeyword;
	}
	public void setRssModifyKeyword(String rssModifyKeyword) {
		this.rssModifyKeyword = rssModifyKeyword;
	}
	public String getRssModifyUrl() {
		return rssModifyUrl;
	}
	public void setRssModifyUrl(String rssModifyUrl) {
		this.rssModifyUrl = rssModifyUrl;
	}
	public String getRssModifySite() {
		return rssModifySite;
	}
	public void setRssModifySite(String rssModifySite) {
		this.rssModifySite = rssModifySite;
	}
	
	@Override
	public String toString() {
		return "RssHistory [rssHistoryCode=" + rssHistoryCode + ", rssModifyDate=" + rssModifyDate + ", rssModifyTime="
				+ rssModifyTime + ", rssModifyType=" + rssModifyType + ", rssModifyNickname=" + rssModifyNickname
				+ ", rssCode=" + rssCode + ", rssModifyKeyword=" + rssModifyKeyword + ", rssModifyUrl=" + rssModifyUrl
				+ ", rssModifySite=" + rssModifySite + "]";
	}

	
	
	
	
}
