package com.stepup.agile.userInfo.model.vo;

import com.stepup.agile.projectManage.model.vo.Project;
import com.stepup.agile.projectManage.model.vo.ProjectHistory;

public class UserProjectList implements java.io.Serializable {
	private int projectCode;
	private String userProjectUpdateDate;
	private String userProjectUpdateTime;
	private String userProjectStatus;
	private int userProjectCode;
	private int userTeamCode;
	private String userProjectAuthority;
	
	private Project project;
	private ProjectHistory projectHistory;
	private Member member;
	private UserTeamList userTeamList;
	
	public UserProjectList() {}

	public UserProjectList(int projectCode, String userProjectUpdateDate, String userProjectUpdateTime,
			String userProjectStatus, int userProjectCode, int userTeamCode, String userProjectAuthority,
			Project project, ProjectHistory projectHistory, Member member, UserTeamList userTeamList) {
		super();
		this.projectCode = projectCode;
		this.userProjectUpdateDate = userProjectUpdateDate;
		this.userProjectUpdateTime = userProjectUpdateTime;
		this.userProjectStatus = userProjectStatus;
		this.userProjectCode = userProjectCode;
		this.userTeamCode = userTeamCode;
		this.userProjectAuthority = userProjectAuthority;
		this.project = project;
		this.projectHistory = projectHistory;
		this.member = member;
		this.userTeamList = userTeamList;
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

	
	
	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public ProjectHistory getProjectHistory() {
		return projectHistory;
	}

	public void setProjectHistory(ProjectHistory projectHistory) {
		this.projectHistory = projectHistory;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public UserTeamList getUserTeamList() {
		return userTeamList;
	}

	public void setUserTeamList(UserTeamList userTeamList) {
		this.userTeamList = userTeamList;
	}

	@Override
	public String toString() {
		return "UserProjectList [projectCode=" + projectCode + ", userProjectUpdateDate=" + userProjectUpdateDate
				+ ", userProjectUpdateTime=" + userProjectUpdateTime + ", userProjectStatus=" + userProjectStatus
				+ ", userProjectCode=" + userProjectCode + ", userTeamCode=" + userTeamCode + ", userProjectAuthority="
				+ userProjectAuthority + ", member=" + member + ", userTeamList=" + userTeamList + "]";
	}

	
}
