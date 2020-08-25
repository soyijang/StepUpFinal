package com.stepup.agile.userMyTasks.model.vo;

public class MyTask implements java.io.Serializable{
	
	private int myTasksCode;
	private String myTaskscontents;
	private String myTasksstartDate;
	private String myTasksstartTime;
	private String myTasksendDate;
	private String myTasksendTime;
	private String myTasksenrollDate;
	private String myTasksenrollTime;
	private int userProjectCode;
	private String myTasksShareYN;
	public MyTask() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MyTask(int myTasksCode, String myTaskscontents, String myTasksstartDate, String myTasksstartTime,
			String myTasksendDate, String myTasksendTime, String myTasksenrollDate, String myTasksenrollTime,
			int userProjectCode, String myTasksShareYN) {
		super();
		this.myTasksCode = myTasksCode;
		this.myTaskscontents = myTaskscontents;
		this.myTasksstartDate = myTasksstartDate;
		this.myTasksstartTime = myTasksstartTime;
		this.myTasksendDate = myTasksendDate;
		this.myTasksendTime = myTasksendTime;
		this.myTasksenrollDate = myTasksenrollDate;
		this.myTasksenrollTime = myTasksenrollTime;
		this.userProjectCode = userProjectCode;
		this.myTasksShareYN = myTasksShareYN;
	}
	public int getMyTasksCode() {
		return myTasksCode;
	}
	public void setMyTasksCode(int myTasksCode) {
		this.myTasksCode = myTasksCode;
	}
	public String getMyTaskscontents() {
		return myTaskscontents;
	}
	public void setMyTaskscontents(String myTaskscontents) {
		this.myTaskscontents = myTaskscontents;
	}
	public String getMyTasksstartDate() {
		return myTasksstartDate;
	}
	public void setMyTasksstartDate(String myTasksstartDate) {
		this.myTasksstartDate = myTasksstartDate;
	}
	public String getMyTasksstartTime() {
		return myTasksstartTime;
	}
	public void setMyTasksstartTime(String myTasksstartTime) {
		this.myTasksstartTime = myTasksstartTime;
	}
	public String getMyTasksendDate() {
		return myTasksendDate;
	}
	public void setMyTasksendDate(String myTasksendDate) {
		this.myTasksendDate = myTasksendDate;
	}
	public String getMyTasksendTime() {
		return myTasksendTime;
	}
	public void setMyTasksendTime(String myTasksendTime) {
		this.myTasksendTime = myTasksendTime;
	}
	public String getMyTasksenrollDate() {
		return myTasksenrollDate;
	}
	public void setMyTasksenrollDate(String myTasksenrollDate) {
		this.myTasksenrollDate = myTasksenrollDate;
	}
	public String getMyTasksenrollTime() {
		return myTasksenrollTime;
	}
	public void setMyTasksenrollTime(String myTasksenrollTime) {
		this.myTasksenrollTime = myTasksenrollTime;
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
		return "MyTask [myTasksCode=" + myTasksCode + ", myTaskscontents=" + myTaskscontents + ", myTasksstartDate="
				+ myTasksstartDate + ", myTasksstartTime=" + myTasksstartTime + ", myTasksendDate=" + myTasksendDate
				+ ", myTasksendTime=" + myTasksendTime + ", myTasksenrollDate=" + myTasksenrollDate
				+ ", myTasksenrollTime=" + myTasksenrollTime + ", userProjectCode=" + userProjectCode
				+ ", myTasksShareYN=" + myTasksShareYN + "]";
	}
	
	
}
