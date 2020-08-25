package com.stepup.agile.projectManage.model.vo;


public class ProjectHistory implements java.io.Serializable{
	private int projectHistCode;
	private String projectHistDate;
	private String projectStatus;
	private String projectStartDate;
	private String projectEndDate;
	private int projectCode;
	private String projectHistTime;
	private String projectIntro;
	private String projectStartTime;
	private String projectEndTime;
	
	public ProjectHistory() {}
	public ProjectHistory(int projectHistCode, String projectHistDate, String projectStatus, String projectStartDate,
			String projectEndDate, int projectCode, String projectHistTime, String projectIntro,
			String projectStartTime, String projectEndTime) {
		super();
		this.projectHistCode = projectHistCode;
		this.projectHistDate = projectHistDate;
		this.projectStatus = projectStatus;
		this.projectStartDate = projectStartDate;
		this.projectEndDate = projectEndDate;
		this.projectCode = projectCode;
		this.projectHistTime = projectHistTime;
		this.projectIntro = projectIntro;
		this.projectStartTime = projectStartTime;
		this.projectEndTime = projectEndTime;
	}
	public int getProjectHistCode() {
		return projectHistCode;
	}
	public void setProjectHistCode(int projectHistCode) {
		this.projectHistCode = projectHistCode;
	}
	public String getProjectHistDate() {
		return projectHistDate;
	}
	public void setProjectHistDate(String projectHistDate) {
		this.projectHistDate = projectHistDate;
	}
	public String getProjectStatus() {
		return projectStatus;
	}
	public void setProjectStatus(String projectStatus) {
		this.projectStatus = projectStatus;
	}
	public String getProjectStartDate() {
		return projectStartDate;
	}
	public void setProjectStartDate(String projectStartDate) {
		this.projectStartDate = projectStartDate;
	}
	public String getProjectEndDate() {
		return projectEndDate;
	}
	public void setProjectEndDate(String projectEndDate) {
		this.projectEndDate = projectEndDate;
	}
	public int getProjectCode() {
		return projectCode;
	}
	public void setProjectCode(int projectCode) {
		this.projectCode = projectCode;
	}
	public String getProjectHistTime() {
		return projectHistTime;
	}
	public void setProjectHistTime(String projectHistTime) {
		this.projectHistTime = projectHistTime;
	}
	public String getProjectIntro() {
		return projectIntro;
	}
	public void setProjectIntro(String projectIntro) {
		this.projectIntro = projectIntro;
	}
	public String getProjectStartTime() {
		return projectStartTime;
	}
	public void setProjectStartTime(String projectStartTime) {
		this.projectStartTime = projectStartTime;
	}
	public String getProjectEndTime() {
		return projectEndTime;
	}
	public void setProjectEndTime(String projectEndTime) {
		this.projectEndTime = projectEndTime;
	}
	@Override
	public String toString() {
		return "ProjectHistory [projectHistCode=" + projectHistCode + ", projectHistDate=" + projectHistDate
				+ ", projectStatus=" + projectStatus + ", projectStartDate=" + projectStartDate + ", projectEndDate="
				+ projectEndDate + ", projectCode=" + projectCode + ", projectHistTime=" + projectHistTime
				+ ", projectIntro=" + projectIntro + ", projectStartTime=" + projectStartTime + ", projectEndTime="
				+ projectEndTime + "]";
	}

	
}
