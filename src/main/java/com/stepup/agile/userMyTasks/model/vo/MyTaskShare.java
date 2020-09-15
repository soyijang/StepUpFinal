package com.stepup.agile.userMyTasks.model.vo;

public class MyTaskShare {
	
	private int mytasksShareCode;
	private String mytasksShareType;
	private String mytasksShareDate;
	private String myTasksShareTime;
	private int myTasksCode;
	public MyTaskShare() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MyTaskShare(int mytasksShareCode, String mytasksShareType, String mytasksShareDate, String myTasksShareTime,
			int myTasksCode) {
		super();
		this.mytasksShareCode = mytasksShareCode;
		this.mytasksShareType = mytasksShareType;
		this.mytasksShareDate = mytasksShareDate;
		this.myTasksShareTime = myTasksShareTime;
		this.myTasksCode = myTasksCode;
	}
	public int getMytasksShareCode() {
		return mytasksShareCode;
	}
	public void setMytasksShareCode(int mytasksShareCode) {
		this.mytasksShareCode = mytasksShareCode;
	}
	public String getMytasksShareType() {
		return mytasksShareType;
	}
	public void setMytasksShareType(String mytasksShareType) {
		this.mytasksShareType = mytasksShareType;
	}
	public String getMytasksShareDate() {
		return mytasksShareDate;
	}
	public void setMytasksShareDate(String mytasksShareDate) {
		this.mytasksShareDate = mytasksShareDate;
	}
	public String getMyTasksShareTime() {
		return myTasksShareTime;
	}
	public void setMyTasksShareTime(String myTasksShareTime) {
		this.myTasksShareTime = myTasksShareTime;
	}
	public int getMyTasksCode() {
		return myTasksCode;
	}
	public void setMyTasksCode(int myTasksCode) {
		this.myTasksCode = myTasksCode;
	}
	@Override
	public String toString() {
		return "MyTaskShare [mytasksShareCode=" + mytasksShareCode + ", mytasksShareType=" + mytasksShareType
				+ ", mytasksShareDate=" + mytasksShareDate + ", myTasksShareTime=" + myTasksShareTime + ", myTasksCode="
				+ myTasksCode + "]";
	}
	
	
	
	
}
