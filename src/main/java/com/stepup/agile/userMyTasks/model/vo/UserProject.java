package com.stepup.agile.userMyTasks.model.vo;

public class UserProject {

	private int userProjectCode;
	private String projectName;
	
	public UserProject() {
		super();
	}
	public UserProject(int userProjectCode, String projectName) {
		super();
		this.userProjectCode = userProjectCode;
		this.projectName = projectName;
	}
	public int getUserProjectCode() {
		return userProjectCode;
	}
	public void setUserProjectCode(int userProjectCode) {
		this.userProjectCode = userProjectCode;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	@Override
	public String toString() {
		return "UserProject [userProjectCode=" + userProjectCode + ", projectName=" + projectName + "]";
	}
	
	
}
