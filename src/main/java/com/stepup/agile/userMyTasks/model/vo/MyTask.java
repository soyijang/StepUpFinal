package com.stepup.agile.userMyTasks.model.vo;

public class MyTask implements java.io.Serializable{
	
	private int myTasksCode;
	private String contents;
	private String startDate;
	private String startTime;
	private String endDate;
	private String endTime;
	private String enrollDate;
	private String enrollTime;
	private int userProjectCode;
	private String myTasksShareYN;
	public MyTask() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MyTask(int myTasksCode, String contents, String startDate, String startTime, String endDate,
			String endTime, String enrollDate, String enrollTime, int userProjectCode, String myTasksShareYN) {
		super();
		this.myTasksCode = myTasksCode;
		this.contents = contents;
		this.startDate = startDate;
		this.startTime = startTime;
		this.endDate = endDate;
		this.endTime = endTime;
		this.enrollDate = enrollDate;
		this.enrollTime = enrollTime;
		this.userProjectCode = userProjectCode;
		this.myTasksShareYN = myTasksShareYN;
	}
	public int getMyTasksCode() {
		return myTasksCode;
	}
	public void setMyTasksCode(int myTasksCode) {
		this.myTasksCode = myTasksCode;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}
	public String getEnrollTime() {
		return enrollTime;
	}
	public void setEnrollTime(String enrollTime) {
		this.enrollTime = enrollTime;
	}
	public int getUserProjectCode() {
		return userProjectCode;
	}
	public void setUserProjectCode(int userProjectCode) {
		this.userProjectCode = userProjectCode;
	}
	public String getMyTasksShareYN() {
		return myTasksShareYN;
	}
	public void setMyTasksShareYN(String myTasksShareYN) {
		this.myTasksShareYN = myTasksShareYN;
	}
	@Override
	public String toString() {
		return "MyTasksVo [myTasksCode=" + myTasksCode + ", contents=" + contents + ", startDate=" + startDate
				+ ", startTime=" + startTime + ", endDate=" + endDate + ", endTime=" + endTime + ", enrollDate="
				+ enrollDate + ", enrollTime=" + enrollTime + ", userProjectCode=" + userProjectCode
				+ ", myTasksShareYN=" + myTasksShareYN + "]";
	}
	
	
	
}
