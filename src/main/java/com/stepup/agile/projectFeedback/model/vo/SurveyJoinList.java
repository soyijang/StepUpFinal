package com.stepup.agile.projectFeedback.model.vo;

public class SurveyJoinList implements java.io.Serializable{
	
	private int surveyJoinCode;
	private String surveyJoinEmail;
	private String surveyJoinReply;
	private int userCode;
	private String surveyReplyDate;
	private String surveyReplyTime;
	private int surveyCode;
	
	public SurveyJoinList() {
		super();
	}

	public SurveyJoinList(int surveyJoinCode, String surveyJoinEmail, String surveyJoinReply, int userCode,
			String surveyReplyDate, String surveyReplyTime, int surveyCode) {
		super();
		this.surveyJoinCode = surveyJoinCode;
		this.surveyJoinEmail = surveyJoinEmail;
		this.surveyJoinReply = surveyJoinReply;
		this.userCode = userCode;
		this.surveyReplyDate = surveyReplyDate;
		this.surveyReplyTime = surveyReplyTime;
		this.surveyCode = surveyCode;
	}

	public int getSurveyJoinCode() {
		return surveyJoinCode;
	}

	public void setSurveyJoinCode(int surveyJoinCode) {
		this.surveyJoinCode = surveyJoinCode;
	}

	public String getSurveyJoinEmail() {
		return surveyJoinEmail;
	}

	public void setSurveyJoinEmail(String surveyJoinEmail) {
		this.surveyJoinEmail = surveyJoinEmail;
	}

	public String getSurveyJoinReply() {
		return surveyJoinReply;
	}

	public void setSurveyJoinReply(String surveyJoinReply) {
		this.surveyJoinReply = surveyJoinReply;
	}

	public int getUserCode() {
		return userCode;
	}

	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}

	public String getSurveyReplyDate() {
		return surveyReplyDate;
	}

	public void setSurveyReplyDate(String surveyReplyDate) {
		this.surveyReplyDate = surveyReplyDate;
	}

	public String getSurveyReplyTime() {
		return surveyReplyTime;
	}

	public void setSurveyReplyTime(String surveyReplyTime) {
		this.surveyReplyTime = surveyReplyTime;
	}

	public int getSurveyCode() {
		return surveyCode;
	}

	public void setSurveyCode(int surveyCode) {
		this.surveyCode = surveyCode;
	}

	@Override
	public String toString() {
		return "SurveyJoinList [surveyJoinCode=" + surveyJoinCode + ", surveyJoinEmail=" + surveyJoinEmail
				+ ", surveyJoinReply=" + surveyJoinReply + ", userCode=" + userCode + ", surveyReplyDate="
				+ surveyReplyDate + ", surveyReplyTime=" + surveyReplyTime + ", surveyCode=" + surveyCode + "]";
	}
	

}

