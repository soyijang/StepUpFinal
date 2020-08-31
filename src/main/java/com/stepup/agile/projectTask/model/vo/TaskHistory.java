package com.stepup.agile.projectTask.model.vo;

import com.stepup.agile.projectBacklog.model.vo.Sprint;
import com.stepup.agile.projectBacklog.model.vo.SprintHistory;

public class TaskHistory implements java.io.Serializable{
	private String taskHistUpdateDate;
	private String taskHistUpdateTime;
	private int taskCode;
	private int taskHistCode;
	private int masterCode;
	private int userCode;
	private String taskHistValue;
	private String taskCategoryCode;
	
	private TaskList taskList;
	private TaskCategory taskCategory;
	private Sprint sprint;
	private SprintHistory sprintHistory;
	
	
	public TaskHistory() {}


	public TaskHistory(String taskHistUpdateDate, String taskHistUpdateTime, int taskCode, int taskHistCode,
			int masterCode, int userCode, String taskHistValue, String taskCategoryCode, TaskList taskList,
			TaskCategory taskCategory, Sprint sprint, SprintHistory sprintHistory) {
		super();
		this.taskHistUpdateDate = taskHistUpdateDate;
		this.taskHistUpdateTime = taskHistUpdateTime;
		this.taskCode = taskCode;
		this.taskHistCode = taskHistCode;
		this.masterCode = masterCode;
		this.userCode = userCode;
		this.taskHistValue = taskHistValue;
		this.taskCategoryCode = taskCategoryCode;
		this.taskList = taskList;
		this.taskCategory = taskCategory;
		this.sprint = sprint;
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


	public Sprint getSprint() {
		return sprint;
	}


	public void setSprint(Sprint sprint) {
		this.sprint = sprint;
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
				+ taskCategoryCode + ", taskList=" + taskList + ", taskCategory=" + taskCategory + ", sprint=" + sprint
				+ ", sprintHistory=" + sprintHistory + "]";
	}

	
	
}
