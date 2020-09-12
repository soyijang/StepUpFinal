package com.stepup.agile.projectManage.model.vo;

import java.util.ArrayList;

import com.stepup.agile.userInfo.model.vo.Member;
import com.stepup.agile.userInfo.model.vo.Team;
import com.stepup.agile.userInfo.model.vo.UserProjectList;
import com.stepup.agile.userInfo.model.vo.UserTeamList;

public class Project implements java.io.Serializable{
	private int projectCode;
	private String projectName;
	private String createDate;
	private String createTime;
	
	private int projectProceedingRate;//프로젝트 진행률 계산값
	private int projectParticipantCnt;//프로젝트 참가자수 계산을 위한 필드
	private int taskCnt;
	private int sprintTypeA;
	private int sprintTypeB;
	private int sprintTypeC;
	private int projectMaster; //프로젝트 마스터 유저번호
	
	private Member member;
	private UserTeamList userTeamList;
	private UserProjectList userProjectList;
	private ProjectHistory projectHistory;
	private Team team;
	
	public Project() {}

	public Project(int projectCode, String projectName, String createDate, String createTime, int projectProceedingRate,
			int projectParticipantCnt, int taskCnt, int sprintTypeA, int sprintTypeB, int sprintTypeC,
			int projectMaster, Member member, UserTeamList userTeamList,
			UserProjectList userProjectList, ProjectHistory projectHistory, Team team) {
		super();
		this.projectCode = projectCode;
		this.projectName = projectName;
		this.createDate = createDate;
		this.createTime = createTime;
		this.projectProceedingRate = projectProceedingRate;
		this.projectParticipantCnt = projectParticipantCnt;
		this.taskCnt = taskCnt;
		this.sprintTypeA = sprintTypeA;
		this.sprintTypeB = sprintTypeB;
		this.sprintTypeC = sprintTypeC;
		this.projectMaster = projectMaster;
		this.member = member;
		this.userTeamList = userTeamList;
		this.userProjectList = userProjectList;
		this.projectHistory = projectHistory;
		this.team = team;
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

	public int getTaskCnt() {
		return taskCnt;
	}

	public void setTaskCnt(int taskCnt) {
		this.taskCnt = taskCnt;
	}

	public Team getTeam() {
		return team;
	}

	public void setTeam(Team team) {
		this.team = team;
	}
	
	public int getProjectProceedingRate() {
		return projectProceedingRate;
	}

	public void setProjectProceedingRate(int projectProceedingRate) {
		this.projectProceedingRate = projectProceedingRate;
	}

	public int getProjectParticipantCnt() {
		return projectParticipantCnt;
	}

	//멤버수 계산을 위한 setter
	public void setProjectParticipantCnt(int projectParticipantCnt) {
		this.projectParticipantCnt += projectParticipantCnt;
	}
	
	public int getSprintTypeA() {
		return sprintTypeA;
	}

	public void setSprintTypeA(int sprintTypeA) {
		this.sprintTypeA = sprintTypeA;
	}

	public int getSprintTypeB() {
		return sprintTypeB;
	}

	public void setSprintTypeB(int sprintTypeB) {
		this.sprintTypeB = sprintTypeB;
	}

	public int getSprintTypeC() {
		return sprintTypeC;
	}

	public void setSprintTypeC(int sprintTypeC) {
		this.sprintTypeC = sprintTypeC;
	}

	public int getProjectMaster() {
		return projectMaster;
	}

	public void setProjectMaster(int projectMaster) {
		this.projectMaster = projectMaster;
	}

	@Override
	public String toString() {
		return "Project [projectCode=" + projectCode + ", projectName=" + projectName + ", createDate=" + createDate
				+ ", createTime=" + createTime + ", projectProceedingRate=" + projectProceedingRate
				+ ", projectParticipantCnt=" + projectParticipantCnt + ", taskCnt=" + taskCnt + ", sprintTypeA="
				+ sprintTypeA + ", sprintTypeB=" + sprintTypeB + ", sprintTypeC=" + sprintTypeC + ", projectMaster="
				+ projectMaster + ", member=" + member + ", userTeamList=" + userTeamList + ", userProjectList="
				+ userProjectList + ", projectHistory=" + projectHistory + ", team=" + team + "]";
	}

	
	
	
}
