package com.stepup.agile.projectBacklog.model.vo;

public class Sprint implements java.io.Serializable{

	private int sprintCode;
	private String sprintCreateDate;
	private int sprintProjectCode;
	private String sprintCreateTime;
	public Sprint() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Sprint(int sprintCode, String sprintCreateDate, int sprintProjectCode, String sprintCreateTime) {
		super();
		this.sprintCode = sprintCode;
		this.sprintCreateDate = sprintCreateDate;
		this.sprintProjectCode = sprintProjectCode;
		this.sprintCreateTime = sprintCreateTime;
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
	@Override
	public String toString() {
		return "Sprint [sprintCode=" + sprintCode + ", sprintCreateDate=" + sprintCreateDate + ", sprintProjectCode="
				+ sprintProjectCode + ", sprintCreateTime=" + sprintCreateTime + "]";
	}
	
	
	
}
