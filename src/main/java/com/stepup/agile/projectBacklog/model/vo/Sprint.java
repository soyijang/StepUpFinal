package com.stepup.agile.projectBacklog.model.vo;

import com.stepup.agile.userInfo.model.vo.Member;
import com.stepup.agile.userInfo.model.vo.UserProjectList;
import com.stepup.agile.userInfo.model.vo.UserTeamList;

public class Sprint implements java.io.Serializable{

	private int sprintCode;
	private String sprintCreateDate;
	private int sprintProjectCode;
	private String sprintCreateTime;
	
	private SprintHistory sprintHistory;
	private UserProjectList userProjectList;
	private UserTeamList userTeamList;
	private Member member;
	
	public Sprint(int sprintCode, String sprintCreateDate, int sprintProjectCode, String sprintCreateTime,
			SprintHistory sprintHistory, UserProjectList userProjectList, UserTeamList userTeamList, Member member) {
		super();
		this.sprintCode = sprintCode;
		this.sprintCreateDate = sprintCreateDate;
		this.sprintProjectCode = sprintProjectCode;
		this.sprintCreateTime = sprintCreateTime;
		this.sprintHistory = sprintHistory;
		this.userProjectList = userProjectList;
		this.userTeamList = userTeamList;
		this.member = member;
	}
	public Sprint() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getSprintCode() {
		return sprintCode;
	}
	public void setSprintCode(int sprintCode) {
		this.sprintCode = sprintCode;
	}
	public String getSprintCreateDate() {
		return sprintCreateDate;
	}
	public void setSprintCreateDate(String sprintCreateDate) {
		this.sprintCreateDate = sprintCreateDate;
	}
	public int getSprintProjectCode() {
		return sprintProjectCode;
	}
	public void setSprintProjectCode(int sprintProjectCode) {
		this.sprintProjectCode = sprintProjectCode;
	}
	public String getSprintCreateTime() {
		return sprintCreateTime;
	}
	public void setSprintCreateTime(String sprintCreateTime) {
		this.sprintCreateTime = sprintCreateTime;
	}
	@Override
	public String toString() {
		return "Sprint [sprintCode=" + sprintCode + ", sprintCreateDate=" + sprintCreateDate + ", sprintProjectCode="
				+ sprintProjectCode + ", sprintCreateTime=" + sprintCreateTime + ", sprintHistory=" + sprintHistory
				+ ", userProjectList=" + userProjectList + ", userTeamList=" + userTeamList + ", member=" + member
				+ "]";
	}
	
	
	
	
}
