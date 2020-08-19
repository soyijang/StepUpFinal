package com.stepup.agile;

public class Member implements java.io.Serializable {
	private String userEmail;
	private String userPwd;
	private String userName;
	private int userCode;
	private String userPhone;
	private String userCompName;
	private String userCompDept;
	private String userCompJob;
	private String userEnrollDate;
	private String userStatus;
	private String userManagerYn;
	private String userEnrollTime;
	
	public Member() {}

	public Member(String userEmail, String userPwd, String userName, int userCode, String userPhone,
			String userCompName, String userCompDept, String userCompJob, String userEnrollDate, String userStatus,
			String userManagerYn, String userEnrollTime) {
		super();
		this.userEmail = userEmail;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userCode = userCode;
		this.userPhone = userPhone;
		this.userCompName = userCompName;
		this.userCompDept = userCompDept;
		this.userCompJob = userCompJob;
		this.userEnrollDate = userEnrollDate;
		this.userStatus = userStatus;
		this.userManagerYn = userManagerYn;
		this.userEnrollTime = userEnrollTime;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getUserCode() {
		return userCode;
	}

	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserCompName() {
		return userCompName;
	}

	public void setUserCompName(String userCompName) {
		this.userCompName = userCompName;
	}

	public String getUserCompDept() {
		return userCompDept;
	}

	public void setUserCompDept(String userCompDept) {
		this.userCompDept = userCompDept;
	}

	public String getUserCompJob() {
		return userCompJob;
	}

	public void setUserCompJob(String userCompJob) {
		this.userCompJob = userCompJob;
	}

	public String getUserEnrollDate() {
		return userEnrollDate;
	}

	public void setUserEnrollDate(String userEnrollDate) {
		this.userEnrollDate = userEnrollDate;
	}

	public String getUserStatus() {
		return userStatus;
	}

	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}

	public String getUserManagerYn() {
		return userManagerYn;
	}

	public void setUserManagerYn(String userManagerYn) {
		this.userManagerYn = userManagerYn;
	}

	public String getUserEnrollTime() {
		return userEnrollTime;
	}

	public void setUserEnrollTime(String userEnrollTime) {
		this.userEnrollTime = userEnrollTime;
	}

	@Override
	public String toString() {
		return "Member [userEmail=" + userEmail + ", userPwd=" + userPwd + ", userName=" + userName + ", userCode="
				+ userCode + ", userPhone=" + userPhone + ", userCompName=" + userCompName + ", userCompDept="
				+ userCompDept + ", userCompJob=" + userCompJob + ", userEnrollDate=" + userEnrollDate + ", userStatus="
				+ userStatus + ", userManagerYn=" + userManagerYn + ", userEnrollTime=" + userEnrollTime + "]";
	}

}