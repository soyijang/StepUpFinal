package com.stepup.agile.projectManage.model.vo;

import com.stepup.agile.userInfo.model.vo.Member;
import com.stepup.agile.userInfo.model.vo.UserProjectList;
import com.stepup.agile.userInfo.model.vo.UserTeamList;

public class Project implements java.io.Serializable{
	private int projectCode;
	private String projectName;
	private String createDate;
	private String createTime;
	
	private Member member;
	private UserTeamList userTeamList;
	private UserProjectList userProjectList;
	private ProjectHistory projectHistory;
	
	public Project() {}
	
	public Project(int projectCode, String projectName, String createDate, String createTime, Member member,
			UserTeamList userTeamList, UserProjectList userProjectList, ProjectHistory projectHistory) {
		super();
		this.projectCode = projectCode;
		this.projectName = projectName;
		this.createDate = createDate;
		this.createTime = createTime;
		this.member = member;
		this.userTeamList = userTeamList;
		this.userProjectList = userProjectList;
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


	public UserProjectList getUserProjectList() {
		return userProjectList;
	}


	public void setUserProjectList(UserProjectList userProjectList) {
		this.userProjectList = userProjectList;
	}


	public int getProjectCode() {
		return projectCode;
	}

	public void setProjectCode(int projectCode) {
		this.projectCode = projectCode;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}


	public ProjectHistory getProjectHistory() {
		return projectHistory;
	}

	public void setProjectHistory(ProjectHistory projectHistory) {
		this.projectHistory = projectHistory;
	}

	@Override
	public String toString() {
		return "Project [projectCode=" + projectCode + ", projectName=" + projectName + ", createDate=" + createDate
				+ ", createTime=" + createTime + ", member=" + member + ", userTeamList=" + userTeamList
				+ ", userProjectList=" + userProjectList + ", projectHistory=" + projectHistory + "]";
	}

	
	
}
