package com.stepup.agile.userInfo.model.vo;

public class UserTeamList implements java.io.Serializable {
	private String userTeamDate;
	private String userTeamYn;
	private int userCode;
	private int teamCode;
	private int userTeamCode;
	private String userTeamTime;
	
	private UserProjectList userProjectList;
	private UserTeamList userTeamList;
	
	public UserTeamList() {}

	public UserTeamList(String userTeamDate, String userTeamYn, int userCode, int teamCode, int userTeamCode,
			String userTeamTime, UserProjectList userProjectList, UserTeamList userTeamList) {
		super();
		this.userTeamDate = userTeamDate;
		this.userTeamYn = userTeamYn;
		this.userCode = userCode;
		this.teamCode = teamCode;
		this.userTeamCode = userTeamCode;
		this.userTeamTime = userTeamTime;
		this.userProjectList = userProjectList;
		this.userTeamList = userTeamList;
	}

	public String getUserTeamDate() {
		return userTeamDate;
	}

	public void setUserTeamDate(String userTeamDate) {
		this.userTeamDate = userTeamDate;
	}

	public String getUserTeamYn() {
		return userTeamYn;
	}

	public void setUserTeamYn(String userTeamYn) {
		this.userTeamYn = userTeamYn;
	}

	public int getUserCode() {
		return userCode;
	}

	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}

	public int getTeamCode() {
		return teamCode;
	}

	public void setTeamCode(int teamCode) {
		this.teamCode = teamCode;
	}

	public int getUserTeamCode() {
		return userTeamCode;
	}

	public void setUserTeamCode(int userTeamCode) {
		this.userTeamCode = userTeamCode;
	}

	public String getUserTeamTime() {
		return userTeamTime;
	}

	public void setUserTeamTime(String userTeamTime) {
		this.userTeamTime = userTeamTime;
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
		return "UserTeamList [userTeamDate=" + userTeamDate + ", userTeamYn=" + userTeamYn + ", userCode=" + userCode
				+ ", teamCode=" + teamCode + ", userTeamCode=" + userTeamCode + ", userTeamTime=" + userTeamTime
				+ ", userProjectList=" + userProjectList + ", userTeamList=" + userTeamList + "]";
	}

}
