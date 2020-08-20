package com.stepup.agile.projectManage.model.vo;


public class Project implements java.io.Serializable{
	private int projectCode;
	private String projectName;
	private String createDate;
	private String createTime;
	
	public Project() {}

	public Project(int projectCode, String projectName, String createDate, String createTime) {
		super();
		this.projectCode = projectCode;
		this.projectName = projectName;
		this.createDate = createDate;
		this.createTime = createTime;
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

	@Override
	public String toString() {
		return "ProjectList [projectCode=" + projectCode + ", projectName=" + projectName + ", createDate=" + createDate
				+ ", createTime=" + createTime + "]";
	}
	
	
}
