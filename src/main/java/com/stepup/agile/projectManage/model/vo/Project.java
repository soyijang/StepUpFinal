package com.stepup.agile.projectManage.model.vo;

import com.stepup.agile.projectBacklog.model.vo.Sprint;
import com.stepup.agile.projectBacklog.model.vo.SprintHistory;
import com.stepup.agile.userInfo.model.vo.Member;
import com.stepup.agile.userInfo.model.vo.Team;
import com.stepup.agile.userInfo.model.vo.UserProjectList;
import com.stepup.agile.userInfo.model.vo.UserTeamList;

public class Project implements java.io.Serializable{
	private int projectCode;
	private String projectName;
	private String createDate;
	private String createTime;
	
	private ProjectHistory projectHistory;
	private UserProjectList userProjectList;
	private UserTeamList userTeamList;
	private Member member;
	private Team team;

	public Project() {}





	public Project(int projectCode, String projectName, String createDate, String createTime,
			ProjectHistory projectHistory, UserProjectList userProjectList, UserTeamList userTeamList, Member member,
			Team team) {
		super();
		this.projectCode = projectCode;
		this.projectName = projectName;
		this.createDate = createDate;
		this.createTime = createTime;
		this.projectHistory = projectHistory;
		this.userProjectList = userProjectList;
		this.userTeamList = userTeamList;
		this.member = member;
		this.team = team;
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

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Team getTeam() {
		return team;
	}

	public void setTeam(Team team) {
		this.team = team;
	}

	@Override
	public String toString() {
		return "Project [projectCode=" + projectCode + ", projectName=" + projectName + ", createDate=" + createDate
				+ ", createTime=" + createTime + ", projectHistory=" + projectHistory + ", userProjectList="
				+ userProjectList + ", userTeamList=" + userTeamList + ", member=" + member + ", team=" + team + "]";
	}
}
