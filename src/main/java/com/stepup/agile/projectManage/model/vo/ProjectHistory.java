package com.stepup.agile.projectManage.model.vo;

import com.stepup.agile.userInfo.model.vo.Member;
import com.stepup.agile.userInfo.model.vo.UserProjectList;
import com.stepup.agile.userInfo.model.vo.UserTeamList;

public class ProjectHistory implements java.io.Serializable{
	private int projectHistCode;
	private String projectHistDate;
	private String projectStatus;
	private String projectStartDate;
	private String projectEndDate;
	private int projectCode;
	private String projectHistTime;
	private String projectIntro;
	private String projectStartTime;
	private String projectEndTime;
	
	private Member member;
	private UserTeamList userTeamList;
	private UserProjectList userProjectList;
	private Project project;
	public ProjectHistory() {}
	
	public ProjectHistory(int projectHistCode, String projectHistDate, String projectStatus, String projectStartDate,
			String projectEndDate, int projectCode, String projectHistTime, String projectIntro,
			String projectStartTime, String projectEndTime, Member member, UserTeamList userTeamList,
			UserProjectList userProjectList, Project project) {
		super();
		this.projectHistCode = projectHistCode;
		this.projectHistDate = projectHistDate;
		this.projectStatus = projectStatus;
		this.projectStartDate = projectStartDate;
		this.projectEndDate = projectEndDate;
		this.projectCode = projectCode;
		this.projectHistTime = projectHistTime;
		this.projectIntro = projectIntro;
		this.projectStartTime = projectStartTime;
		this.projectEndTime = projectEndTime;
		this.member = member;
		this.userTeamList = userTeamList;
		this.userProjectList = userProjectList;
		this.project = project;
	}

	public int getProjectHistCode() {
		return projectHistCode;
	}
	public void setProjectHistCode(int projectHistCode) {
		this.projectHistCode = projectHistCode;
	}
	public String getProjectHistDate() {
		return projectHistDate;
	}
	public void setProjectHistDate(String projectHistDate) {
		this.projectHistDate = projectHistDate;
	}
	public String getProjectStatus() {
		return projectStatus;
	}
	public void setProjectStatus(String projectStatus) {
		this.projectStatus = projectStatus;
	}
	public String getProjectStartDate() {
		return projectStartDate;
	}
	public void setProjectStartDate(String projectStartDate) {
		this.projectStartDate = projectStartDate;
	}
	public String getProjectEndDate() {
		return projectEndDate;
	}
	public void setProjectEndDate(String projectEndDate) {
		this.projectEndDate = projectEndDate;
	}
	public int getProjectCode() {
		return projectCode;
	}
	public void setProjectCode(int projectCode) {
		this.projectCode = projectCode;
	}
	public String getProjectHistTime() {
		return projectHistTime;
	}
	public void setProjectHistTime(String projectHistTime) {
		this.projectHistTime = projectHistTime;
	}
	public String getProjectIntro() {
		return projectIntro;
	}
	public void setProjectIntro(String projectIntro) {
		this.projectIntro = projectIntro;
	}
	public String getProjectStartTime() {
		return projectStartTime;
	}
	public void setProjectStartTime(String projectStartTime) {
		this.projectStartTime = projectStartTime;
	}
	public String getProjectEndTime() {
		return projectEndTime;
	}
	public void setProjectEndTime(String projectEndTime) {
		this.projectEndTime = projectEndTime;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
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

	@Override
	public String toString() {
		return "ProjectHistory [projectHistCode=" + projectHistCode + ", projectHistDate=" + projectHistDate
				+ ", projectStatus=" + projectStatus + ", projectStartDate=" + projectStartDate + ", projectEndDate="
				+ projectEndDate + ", projectCode=" + projectCode + ", projectHistTime=" + projectHistTime
				+ ", projectIntro=" + projectIntro + ", projectStartTime=" + projectStartTime + ", projectEndTime="
				+ projectEndTime + ", member=" + member + ", userTeamList=" + userTeamList + ", userProjectList="
				+ userProjectList + ", project=" + project + "]";
	}
}
