package com.stepup.agile.projectTask.model.vo;

public class TaskList implements java.io.Serializable{
	private int taskCode;
	private String taskCreateDate;
	private String taskLevel;
	private int sprintCode;
	private String taskCreateTime;
	private int taskMaster;
	private int taskUser;
	
	public TaskList() {}

	public TaskList(int taskCode, String taskCreateDate, String taskLevel, int sprintCode, String taskCreateTime,
			int taskMaster, int taskUser) {
		super();
		this.taskCode = taskCode;
		this.taskCreateDate = taskCreateDate;
		this.taskLevel = taskLevel;
		this.sprintCode = sprintCode;
		this.taskCreateTime = taskCreateTime;
		this.taskMaster = taskMaster;
		this.taskUser = taskUser;
	}

	public int getTaskCode() {
		return taskCode;
	}

	public void setTaskCode(int taskCode) {
		this.taskCode = taskCode;
	}

	public String getTaskCreateDate() {
		return taskCreateDate;
	}

	public void setTaskCreateDate(String taskCreateDate) {
		this.taskCreateDate = taskCreateDate;
	}

	public String getTaskLevel() {
		return taskLevel;
	}

	public void setTaskLevel(String taskLevel) {
		this.taskLevel = taskLevel;
	}

	public int getSprintCode() {
		return sprintCode;
	}

	public void setSprintCode(int sprintCode) {
		this.sprintCode = sprintCode;
	}

	public String getTaskCreateTime() {
		return taskCreateTime;
	}

	public void setTaskCreateTime(String taskCreateTime) {
		this.taskCreateTime = taskCreateTime;
	}

	public int getTaskMaster() {
		return taskMaster;
	}

	public void setTaskMaster(int taskMaster) {
		this.taskMaster = taskMaster;
	}

	public int getTaskUser() {
		return taskUser;
	}

	public void setTaskUser(int taskUser) {
		this.taskUser = taskUser;
	}

	@Override
	public String toString() {
		return "TaskList [taskCode=" + taskCode + ", taskCreateDate=" + taskCreateDate + ", taskLevel=" + taskLevel
				+ ", sprintCode=" + sprintCode + ", taskCreateTime=" + taskCreateTime + ", taskMaster=" + taskMaster
				+ ", taskUser=" + taskUser + "]";
	}
	
	
}
