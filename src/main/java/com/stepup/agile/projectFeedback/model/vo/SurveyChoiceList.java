package com.stepup.agile.projectFeedback.model.vo;

public class SurveyChoiceList implements java.io.Serializable{
	
	private int surveyQuesCode;
	private int surveyChoiceNum;
	private String surveyChoiceContent;
	
	private SurveyQuesList surveyQuesList;
	private SurveyQuesMatch surveyQuesMatch;
	
	public SurveyChoiceList() {
		super();
	}

	public SurveyChoiceList(int surveyQuesCode, int surveyChoiceNum, String surveyChoiceContent,
			SurveyQuesList surveyQuesList, SurveyQuesMatch surveyQuesMatch) {
		super();
		this.surveyQuesCode = surveyQuesCode;
		this.surveyChoiceNum = surveyChoiceNum;
		this.surveyChoiceContent = surveyChoiceContent;
		this.surveyQuesList = surveyQuesList;
		this.surveyQuesMatch = surveyQuesMatch;
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

	public SurveyQuesList getSurveyQuesList() {
		return surveyQuesList;
	}

	public void setSurveyQuesList(SurveyQuesList surveyQuesList) {
		this.surveyQuesList = surveyQuesList;
	}

	public SurveyQuesMatch getSurveyQuesMatch() {
		return surveyQuesMatch;
	}

	public void setSurveyQuesMatch(SurveyQuesMatch surveyQuesMatch) {
		this.surveyQuesMatch = surveyQuesMatch;
	}

	@Override
	public String toString() {
		return "SurveyChoiceList [surveyQuesCode=" + surveyQuesCode + ", surveyChoiceNum=" + surveyChoiceNum
				+ ", surveyChoiceContent=" + surveyChoiceContent + ", surveyQuesList=" + surveyQuesList
				+ ", surveyQuesMatch=" + surveyQuesMatch + "]";
	}

	
	
}
