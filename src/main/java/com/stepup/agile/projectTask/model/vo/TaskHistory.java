package com.stepup.agile.projectTask.model.vo;

import com.stepup.agile.projectBacklog.model.vo.Sprint;
import com.stepup.agile.projectBacklog.model.vo.SprintHistory;
import com.stepup.agile.userInfo.model.vo.Member;
import com.stepup.agile.userInfo.model.vo.UserProjectList;
import com.stepup.agile.userInfo.model.vo.UserTeamList;

public class TaskHistory implements java.io.Serializable{
	private String taskHistUpdateDate;
	private String taskHistUpdateTime;
	private int taskCode;
	private int taskHistCode;
	private int masterCode;
	private int userCode;
	private String taskHistValue;
	private String taskCategoryCode;
	private String projectName;
	
	private Member member;
	private UserTeamList userTeamList;
	private UserProjectList userProjectList;
	private TaskList taskList;
	private Sprint sprint;
	private TaskCategory taskCategory;
	private SprintHistory sprintHistory;
	
	public TaskHistory() {}

	public TaskHistory(String taskHistUpdateDate, String taskHistUpdateTime, int taskCode, int taskHistCode,
			int masterCode, int userCode, String taskHistValue, String taskCategoryCode, String projectName,
			Member member, UserTeamList userTeamList, UserProjectList userProjectList, TaskList taskList, Sprint sprint,
			TaskCategory taskCategory, SprintHistory sprintHistory) {
		super();
		this.taskHistUpdateDate = taskHistUpdateDate;
		this.taskHistUpdateTime = taskHistUpdateTime;
		this.taskCode = taskCode;
		this.taskHistCode = taskHistCode;
		this.masterCode = masterCode;
		this.userCode = userCode;
		this.taskHistValue = taskHistValue;
		this.taskCategoryCode = taskCategoryCode;
		this.projectName = projectName;
		this.member = member;
		this.userTeamList = userTeamList;
		this.userProjectList = userProjectList;
		this.taskList = taskList;
		this.sprint = sprint;
		this.taskCategory = taskCategory;
		this.sprintHistory = sprintHistory;
	}

	public String getTaskHistUpdateDate() {
		return taskHistUpdateDate;
	}

	public void setTaskHistUpdateDate(String taskHistUpdateDate) {
		this.taskHistUpdateDate = taskHistUpdateDate;
	}

	public String getTaskHistUpdateTime() {
		return taskHistUpdateTime;
	}

	public void setTaskHistUpdateTime(String taskHistUpdateTime) {
		this.taskHistUpdateTime = taskHistUpdateTime;
	}

	public int getTaskCode() {
		return taskCode;
	}

	public void setTaskCode(int taskCode) {
		this.taskCode = taskCode;
	}

	public int getTaskHistCode() {
		return taskHistCode;
	}

	public void setTaskHistCode(int taskHistCode) {
		this.taskHistCode = taskHistCode;
	}

	public int getMasterCode() {
		return masterCode;
	}

	public void setMasterCode(int masterCode) {
		this.masterCode = masterCode;
	}

	public int getUserCode() {
		return userCode;
	}

	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}

	public String getTaskHistValue() {
		return taskHistValue;
	}

	public void setTaskHistValue(String taskHistValue) {
		this.taskHistValue = taskHistValue;
	}

	public String getTaskCategoryCode() {
		return taskCategoryCode;
	}

	public void setTaskCategoryCode(String taskCategoryCode) {
		this.taskCategoryCode = taskCategoryCode;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
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

	public TaskList getTaskList() {
		return taskList;
	}

	public void setTaskList(TaskList taskList) {
		this.taskList = taskList;
	}

	public Sprint getSprint() {
		return sprint;
	}

	public void setSprint(Sprint sprint) {
		this.sprint = sprint;
	}

	public TaskCategory getTaskCategory() {
		return taskCategory;
	}

	public void setTaskCategory(TaskCategory taskCategory) {
		this.taskCategory = taskCategory;
	}

	public SprintHistory getSprintHistory() {
		return sprintHistory;
	}

	public void setSprintHistory(SprintHistory sprintHistory) {
		this.sprintHistory = sprintHistory;
	}

	@Override
	public String toString() {
		return "TaskHistory [taskHistUpdateDate=" + taskHistUpdateDate + ", taskHistUpdateTime=" + taskHistUpdateTime
				+ ", taskCode=" + taskCode + ", taskHistCode=" + taskHistCode + ", masterCode=" + masterCode
				+ ", userCode=" + userCode + ", taskHistValue=" + taskHistValue + ", taskCategoryCode="
				+ taskCategoryCode + ", projectName=" + projectName + ", member=" + member + ", userTeamList="
				+ userTeamList + ", userProjectList=" + userProjectList + ", taskList=" + taskList + ", sprint="
				+ sprint + ", taskCategory=" + taskCategory + ", sprintHistory=" + sprintHistory + "]";
	}
	
	
	
}
