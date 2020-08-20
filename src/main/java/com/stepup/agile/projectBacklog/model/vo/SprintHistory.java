package com.stepup.agile.projectBacklog.model.vo;

public class SprintHistory implements java.io.Serializable{

	private String sprintHistUpdateDate;
	private String sprintName;
	private String sprintType;
	private String sprintExpectPeriod;
	private int sprintHistCode;
	private int sprintCode;
	private String sprintHistUpdateTime;
	private String sprintIntro;
	private String sprintStatus;
	
	public SprintHistory() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public SprintHistory(String sprintHistUpdateDate, String sprintName, String sprintType, String sprintExpectPeriod,
			int sprintHistCode, int sprintCode, String sprintHistUpdateTime, String sprintIntro, String sprintStatus) {
		super();
		this.sprintHistUpdateDate = sprintHistUpdateDate;
		this.sprintName = sprintName;
		this.sprintType = sprintType;
		this.sprintExpectPeriod = sprintExpectPeriod;
		this.sprintHistCode = sprintHistCode;
		this.sprintCode = sprintCode;
		this.sprintHistUpdateTime = sprintHistUpdateTime;
		this.sprintIntro = sprintIntro;
		this.sprintStatus = sprintStatus;
	}



	public String getSprintHistUpdateDate() {
		return sprintHistUpdateDate;
	}
	public void setSprintHistUpdateDate(String sprintHistUpdateDate) {
		this.sprintHistUpdateDate = sprintHistUpdateDate;
	}
	public String getSprintName() {
		return sprintName;
	}
	public void setSprintName(String sprintName) {
		this.sprintName = sprintName;
	}
	public String getSprintType() {
		return sprintType;
	}
	public void setSprintType(String sprintType) {
		this.sprintType = sprintType;
	}
	public String getSprintExpectPeriod() {
		return sprintExpectPeriod;
	}
	public void setSprintExpectPeriod(String sprintExpectPeriod) {
		this.sprintExpectPeriod = sprintExpectPeriod;
	}
	public int getSprintHistCode() {
		return sprintHistCode;
	}
	public void setSprintHistCode(int sprintHistCode) {
		this.sprintHistCode = sprintHistCode;
	}
	public int getSprintCode() {
		return sprintCode;
	}
	public void setSprintCode(int sprintCode) {
		this.sprintCode = sprintCode;
	}
	public String getSprintHistUpdateTime() {
		return sprintHistUpdateTime;
	}
	public void setSprintHistUpdateTime(String sprintHistUpdateTime) {
		this.sprintHistUpdateTime = sprintHistUpdateTime;
	}
	public String getSprintIntro() {
		return sprintIntro;
	}
	public void setSprintIntro(String sprintIntro) {
		this.sprintIntro = sprintIntro;
	}
	public String getSprintStatus() {
		return sprintStatus;
	}
	public void setSprintStatus(String sprintStatus) {
		this.sprintStatus = sprintStatus;
	}
	@Override
	public String toString() {
		return "Sprint [sprintHistUpdateDate=" + sprintHistUpdateDate + ", sprintName=" + sprintName + ", sprintType="
				+ sprintType + ", sprintExpectPeriod=" + sprintExpectPeriod + ", sprintHistCode=" + sprintHistCode
				+ ", sprintCode=" + sprintCode + ", sprintHistUpdateTime=" + sprintHistUpdateTime + ", sprintIntro="
				+ sprintIntro + ", sprintStatus=" + sprintStatus + "]";
	}
	
	
	
}
