package com.stepup.agile.projectFeedback.model.vo;

public class SurveyReplyList implements java.io.Serializable{
	
	private int surveyQuesCode;
	private int surveyJoinCode;
	private String surveyReplyContent;
	private int surveyChoiceNum;
	private int surveyReplyCode;
	private int surveyCode;
	
	public SurveyReplyList() {
		super();
	}

	public SurveyReplyList(int surveyQuesCode, int surveyJoinCode, String surveyReplyContent, int surveyChoiceNum,
			int surveyReplyCode, int surveyCode) {
		super();
		this.surveyQuesCode = surveyQuesCode;
		this.surveyJoinCode = surveyJoinCode;
		this.surveyReplyContent = surveyReplyContent;
		this.surveyChoiceNum = surveyChoiceNum;
		this.surveyReplyCode = surveyReplyCode;
		this.surveyCode = surveyCode;
	}

	public int getSurveyQuesCode() {
		return surveyQuesCode;
	}

	public void setSurveyQuesCode(int surveyQuesCode) {
		this.surveyQuesCode = surveyQuesCode;
	}

	public int getSurveyJoinCode() {
		return surveyJoinCode;
	}

	public void setSurveyJoinCode(int surveyJoinCode) {
		this.surveyJoinCode = surveyJoinCode;
	}

	public String getSurveyReplyContent() {
		return surveyReplyContent;
	}

	public void setSurveyReplyContent(String surveyReplyContent) {
		this.surveyReplyContent = surveyReplyContent;
	}

	public int getSurveyChoiceNum() {
		return surveyChoiceNum;
	}

	public void setSurveyChoiceNum(int surveyChoiceNum) {
		this.surveyChoiceNum = surveyChoiceNum;
	}

	public int getSurveyReplyCode() {
		return surveyReplyCode;
	}

	public void setSurveyReplyCode(int surveyReplyCode) {
		this.surveyReplyCode = surveyReplyCode;
	}

	public int getSurveyCode() {
		return surveyCode;
	}

	public void setSurveyCode(int surveyCode) {
		this.surveyCode = surveyCode;
	}

	@Override
	public String toString() {
		return "SurveyReplyList [surveyQuesCode=" + surveyQuesCode + ", surveyJoinCode=" + surveyJoinCode
				+ ", surveyReplyContent=" + surveyReplyContent + ", surveyChoiceNum=" + surveyChoiceNum
				+ ", surveyReplyCode=" + surveyReplyCode + ", surveyCode=" + surveyCode + "]";
	}
	

} 
