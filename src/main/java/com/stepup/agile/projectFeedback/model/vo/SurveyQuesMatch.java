package com.stepup.agile.projectFeedback.model.vo;

public class SurveyQuesMatch implements java.io.Serializable{
	
	private int surveyQuesCode;
	private int surveyCode;

	public SurveyQuesMatch() {
		super();
	}

	public SurveyQuesMatch(int surveyQuesCode, int surveyCode) {
		super();
		this.surveyQuesCode = surveyQuesCode;
		this.surveyCode = surveyCode;
	}

	public int getSurveyQuesCode() {
		return surveyQuesCode;
	}

	public void setSurveyQuesCode(int surveyQuesCode) {
		this.surveyQuesCode = surveyQuesCode;
	}

	public int getSurveyCode() {
		return surveyCode;
	}

	public void setSurveyCode(int surveyCode) {
		this.surveyCode = surveyCode;
	}

	@Override
	public String toString() {
		return "SurveyQuesMatch [surveyQuesCode=" + surveyQuesCode + ", surveyCode=" + surveyCode + "]";
	}
	
	

}
