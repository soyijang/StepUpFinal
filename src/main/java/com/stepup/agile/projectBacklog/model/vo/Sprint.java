package com.stepup.agile.projectBacklog.model.vo;

import com.stepup.agile.projectTask.model.vo.TaskCategory;
import com.stepup.agile.projectTask.model.vo.TaskHistory;
import com.stepup.agile.projectTask.model.vo.TaskList;
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
	private TaskHistory taskHistory;
	private TaskList taskList;
	private TaskCategory taskCategory;
	public Sprint() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Sprint(int sprintCode, String sprintCreateDate, int sprintProjectCode, String sprintCreateTime,
			SprintHistory sprintHistory, UserProjectList userProjectList, UserTeamList userTeamList, Member member,
			TaskHistory taskHistory, TaskList taskList, TaskCategory taskCategory) {
		super();
		this.sprintCode = sprintCode;
		this.sprintCreateDate = sprintCreateDate;
		this.sprintProjectCode = sprintProjectCode;
		this.sprintCreateTime = sprintCreateTime;
		this.sprintHistory = sprintHistory;
		this.userProjectList = userProjectList;
		this.userTeamList = userTeamList;
		this.member = member;
		this.taskHistory = taskHistory;
		this.taskList = taskList;
		this.taskCategory = taskCategory;
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
	public SprintHistory getSprintHistory() {
		return sprintHistory;
	}
	public void setSprintHistory(SprintHistory sprintHistory) {
		this.sprintHistory = sprintHistory;
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
	public TaskHistory getTaskHistory() {
		return taskHistory;
	}
	public void setTaskHistory(TaskHistory taskHistory) {
		this.taskHistory = taskHistory;
	}
	public TaskList getTaskList() {
		return taskList;
	}
	public void setTaskList(TaskList taskList) {
		this.taskList = taskList;
	}
	public TaskCategory getTaskCategory() {
		return taskCategory;
	}
	public void setTaskCategory(TaskCategory taskCategory) {
		this.taskCategory = taskCategory;
	}
	@Override
	public String toString() {
		return "Sprint [sprintCode=" + sprintCode + ", sprintCreateDate=" + sprintCreateDate + ", sprintProjectCode="
				+ sprintProjectCode + ", sprintCreateTime=" + sprintCreateTime + ", sprintHistory=" + sprintHistory
				+ ", userProjectList=" + userProjectList + ", userTeamList=" + userTeamList + ", member=" + member
				+ ", taskHistory=" + taskHistory + ", taskList=" + taskList + ", taskCategory=" + taskCategory + "]";
	}
	
	
	
	
	
	
}
