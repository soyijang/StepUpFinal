package com.stepup.agile.userMyTasks.model.vo;

import com.stepup.agile.userInfo.model.vo.UserProjectList;
import com.stepup.agile.userInfo.model.vo.UserTeamList;

public class RssHistory implements java.io.Serializable {
	
	private int rssCode;
	private String rssModifyDate;
	private String rssModifyTime;
	private String rssModifyNickname;
	private String rssModifyKeyword;
	private String rssModifyUrl;
	private String rssModifySite;
	private int rssProjectCode;
	
	private UserProjectList userProjectList;
	private UserTeamList userTeamList;
	
	public RssHistory() {}

	public RssHistory(int rssCode, String rssModifyDate, String rssModifyTime, String rssModifyNickname,
			String rssModifyKeyword, String rssModifyUrl, String rssModifySite, int rssProjectCode,
			UserProjectList userProjectList, UserTeamList userTeamList) {
		super();
		this.rssCode = rssCode;
		this.rssModifyDate = rssModifyDate;
		this.rssModifyTime = rssModifyTime;
		this.rssModifyNickname = rssModifyNickname;
		this.rssModifyKeyword = rssModifyKeyword;
		this.rssModifyUrl = rssModifyUrl;
		this.rssModifySite = rssModifySite;
		this.rssProjectCode = rssProjectCode;
		this.userProjectList = userProjectList;
		this.userTeamList = userTeamList;
	}

	public int getRssCode() {
		return rssCode;
	}

	public void setRssCode(int rssCode) {
		this.rssCode = rssCode;
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

	public String getRssModifyNickname() {
		return rssModifyNickname;
	}

	public void setRssModifyNickname(String rssModifyNickname) {
		this.rssModifyNickname = rssModifyNickname;
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

	public int getRssProjectCode() {
		return rssProjectCode;
	}

	public void setRssProjectCode(int rssProjectCode) {
		this.rssProjectCode = rssProjectCode;
	}

	public UserProjectList getUserProjectList() {
		return userProjectList;
	}

	public void setUserProjectList(UserProjectList userProjectList) {
		this.userProjectList = userProjectList;
	}

	public UserTeamList getUserTeamList() {
		return userTeamList;
	}

	public void setUserTeamList(UserTeamList userTeamList) {
		this.userTeamList = userTeamList;
	}

	@Override
	public String toString() {
		return "RssHistory [rssCode=" + rssCode + ", rssModifyDate=" + rssModifyDate + ", rssModifyTime="
				+ rssModifyTime + ", rssModifyNickname=" + rssModifyNickname + ", rssModifyKeyword=" + rssModifyKeyword
				+ ", rssModifyUrl=" + rssModifyUrl + ", rssModifySite=" + rssModifySite + ", rssProjectCode="
				+ rssProjectCode + ", userProjectList=" + userProjectList + ", userTeamList=" + userTeamList + "]";
	}
	
}
