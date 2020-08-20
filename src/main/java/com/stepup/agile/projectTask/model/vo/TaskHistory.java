package com.stepup.agile.projectTask.model.vo;

public class TaskHistory implements java.io.Serializable{
	private String taskHistUpdateDate;
	private String taskHistUpdateTime;
	private int taskCode;
	private int taskHistCode;
	private int masterCode;
	private int userCode;
	private String taskHistValue;
	private String taskCategoryCode;
	
	public TaskHistory() {}

	public TaskHistory(String taskHistUpdateDate, String taskHistUpdateTime, int taskCode, int taskHistCode,
			int masterCode, int userCode, String taskHistValue, String taskCategoryCode) {
		super();
		this.taskHistUpdateDate = taskHistUpdateDate;
		this.taskHistUpdateTime = taskHistUpdateTime;
		this.taskCode = taskCode;
		this.taskHistCode = taskHistCode;
		this.masterCode = masterCode;
		this.userCode = userCode;
		this.taskHistValue = taskHistValue;
		this.taskCategoryCode = taskCategoryCode;
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

	@Override
	public String toString() {
		return "TaskHistory [taskHistUpdateDate=" + taskHistUpdateDate + ", taskHistUpdateTime=" + taskHistUpdateTime
				+ ", taskCode=" + taskCode + ", taskHistCode=" + taskHistCode + ", masterCode=" + masterCode
				+ ", userCode=" + userCode + ", taskHistValue=" + taskHistValue + ", taskCategoryCode="
				+ taskCategoryCode + "]";
	}
	
	
	
}
