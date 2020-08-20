package com.stepup.agile.projectTask.model.vo;

public class TaskCategory implements java.io.Serializable{
	private String taskCategoryCode;
	private String taskCategoryName;
	
	public TaskCategory() {}

	public TaskCategory(String taskCategoryCode, String taskCategoryName) {
		super();
		this.taskCategoryCode = taskCategoryCode;
		this.taskCategoryName = taskCategoryName;
	}

	public String getTaskCategoryCode() {
		return taskCategoryCode;
	}

	public void setTaskCategoryCode(String taskCategoryCode) {
		this.taskCategoryCode = taskCategoryCode;
	}

	public String getTaskCategoryName() {
		return taskCategoryName;
	}

	public void setTaskCategoryName(String taskCategoryName) {
		this.taskCategoryName = taskCategoryName;
	}

	@Override
	public String toString() {
		return "TaskCategory [taskCategoryCode=" + taskCategoryCode + ", taskCategoryName=" + taskCategoryName + "]";
	}
	
	
}
