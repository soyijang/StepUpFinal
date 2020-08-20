package com.stepup.agile.userInfo.model.vo;

public class UserProjectList implements java.io.Serializable {
	private int projectCode;
	private String userProjectUpdateDate;
	private String userProjectUpdateTime;
	private String userProjectStatus;
	private int userProjectCode;
	private int userTeamCode;
	private String userProjectAuthority;
	
	public UserProjectList() {}

	public UserProjectList(int projectCode, String userProjectUpdateDate, String userProjectUpdateTime,
			String userProjectStatus, int userProjectCode, int userTeamCode, String userProjectAuthority) {
		super();
		this.projectCode = projectCode;
		this.userProjectUpdateDate = userProjectUpdateDate;
		this.userProjectUpdateTime = userProjectUpdateTime;
		this.userProjectStatus = userProjectStatus;
		this.userProjectCode = userProjectCode;
		this.userTeamCode = userTeamCode;
		this.userProjectAuthority = userProjectAuthority;
	}

	public int getProjectCode() {
		return projectCode;
	}

	public void setProjectCode(int projectCode) {
		this.projectCode = projectCode;
	}

	public String getUserProjectUpdateDate() {
		return userProjectUpdateDate;
	}

	public void setUserProjectUpdateDate(String userProjectUpdateDate) {
		this.userProjectUpdateDate = userProjectUpdateDate;
	}

	public String getUserProjectUpdateTime() {
		return userProjectUpdateTime;
	}

	public void setUserProjectUpdateTime(String userProjectUpdateTime) {
		this.userProjectUpdateTime = userProjectUpdateTime;
	}

	public String getUserProjectStatus() {
		return userProjectStatus;
	}

	public void setUserProjectStatus(String userProjectStatus) {
		this.userProjectStatus = userProjectStatus;
	}

	public int getUserProjectCode() {
		return userProjectCode;
	}

	public void setUserProjectCode(int userProjectCode) {
		this.userProjectCode = userProjectCode;
	}

	public int getUserTeamCode() {
		return userTeamCode;
	}

	public void setUserTeamCode(int userTeamCode) {
		this.userTeamCode = userTeamCode;
	}

	public String getUserProjectAuthority() {
		return userProjectAuthority;
	}

	public void setUserProjectAuthority(String userProjectAuthority) {
		this.userProjectAuthority = userProjectAuthority;
	}

	@Override
	public String toString() {
		return "UserProjectList [projectCode=" + projectCode + ", userProjectUpdateDate=" + userProjectUpdateDate
				+ ", userProjectUpdateTime=" + userProjectUpdateTime + ", userProjectStatus=" + userProjectStatus
				+ ", userProjectCode=" + userProjectCode + ", userTeamCode=" + userTeamCode + ", userProjectAuthority="
				+ userProjectAuthority + "]";
	}
}
