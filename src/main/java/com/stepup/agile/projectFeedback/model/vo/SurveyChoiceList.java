package com.stepup.agile.projectFeedback.model.vo;

public class SurveyChoiceList implements java.io.Serializable{
	
	private int surveyQuesCode;
	private int surveyChoiceNum;
	private String surveyChoiceContent;
	
	public SurveyChoiceList() {
		super();
	}

	public SurveyChoiceList(int surveyQuesCode, int surveyChoiceNum, String surveyChoiceContent) {
		super();
		this.surveyQuesCode = surveyQuesCode;
		this.surveyChoiceNum = surveyChoiceNum;
		this.surveyChoiceContent = surveyChoiceContent;
	}

	public int getSurveyQuesCode() {
		return surveyQuesCode;
	}

	public void setSurveyQuesCode(int surveyQuesCode) {
		this.surveyQuesCode = surveyQuesCode;
	}

	public int getSurveyChoiceNum() {
		return surveyChoiceNum;
	}

	public void setSurveyChoiceNum(int surveyChoiceNum) {
		this.surveyChoiceNum = surveyChoiceNum;
	}

	public String getSurveyChoiceContent() {
		return surveyChoiceContent;
	}

	public void setSurveyChoiceContent(String surveyChoiceContent) {
		this.surveyChoiceContent = surveyChoiceContent;
	}

	@Override
	public String toString() {
		return "SurveyChoiceList [surveyQuesCode=" + surveyQuesCode + ", surveyChoiceNum=" + surveyChoiceNum
				+ ", surveyChoiceContent=" + surveyChoiceContent + "]";
	}
	
}
