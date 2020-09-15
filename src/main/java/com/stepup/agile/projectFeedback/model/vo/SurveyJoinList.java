package com.stepup.agile.projectFeedback.model.vo;

import java.util.List;

public class SurveyJoinList implements java.io.Serializable{
	
	private int surveyJoinCode;
	private String surveyJoinEmail;
	private String surveyJoinReply;
	private String surveyReplyDate;
	private String surveyReplyTime;
	private int surveyCode;
	private String surveyJoinName;
	
	private List<SurveyJoinList> surveyJoinVOList;
	
	public SurveyJoinList() {
		super();
	}

	public SurveyJoinList(int surveyJoinCode, String surveyJoinEmail, String surveyJoinReply, String surveyReplyDate,
			String surveyReplyTime, int surveyCode, String surveyJoinName, List<SurveyJoinList> surveyJoinVOList) {
		super();
		this.surveyJoinCode = surveyJoinCode;
		this.surveyJoinEmail = surveyJoinEmail;
		this.surveyJoinReply = surveyJoinReply;
		this.surveyReplyDate = surveyReplyDate;
		this.surveyReplyTime = surveyReplyTime;
		this.surveyCode = surveyCode;
		this.surveyJoinName = surveyJoinName;
		this.surveyJoinVOList = surveyJoinVOList;
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

	public String getSurveyJoinName() {
		return surveyJoinName;
	}

	public void setSurveyJoinName(String surveyJoinName) {
		this.surveyJoinName = surveyJoinName;
	}

	public List<SurveyJoinList> getSurveyJoinVOList() {
		return surveyJoinVOList;
	}

	public void setSurveyJoinVOList(List<SurveyJoinList> surveyJoinVOList) {
		this.surveyJoinVOList = surveyJoinVOList;
	}

	@Override
	public String toString() {
		return "SurveyJoinList [surveyJoinCode=" + surveyJoinCode + ", surveyJoinEmail=" + surveyJoinEmail
				+ ", surveyJoinReply=" + surveyJoinReply + ", surveyReplyDate=" + surveyReplyDate + ", surveyReplyTime="
				+ surveyReplyTime + ", surveyCode=" + surveyCode + ", surveyJoinName=" + surveyJoinName
				+ ", surveyJoinVOList=" + surveyJoinVOList + "]";
	}
	
}

