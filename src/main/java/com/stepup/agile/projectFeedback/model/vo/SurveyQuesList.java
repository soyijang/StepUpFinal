package com.stepup.agile.projectFeedback.model.vo;

public class SurveyQuesList implements java.io.Serializable{
	
	private int surveyQuesCode;
	private String surveyQuesType;
	private String surveyQuesName;
	private String surveyQuesMust;
	private String surveyQuesMulti;
	
	public SurveyQuesList() {
		super();
	}

	public SurveyQuesList(int surveyQuesCode, String surveyQuesType, String surveyQuesName, String surveyQuesMust,
			String surveyQuesMulti) {
		super();
		this.surveyQuesCode = surveyQuesCode;
		this.surveyQuesType = surveyQuesType;
		this.surveyQuesName = surveyQuesName;
		this.surveyQuesMust = surveyQuesMust;
		this.surveyQuesMulti = surveyQuesMulti;
	}

	public int getSurveyQuesCode() {
		return surveyQuesCode;
	}

	public void setSurveyQuesCode(int surveyQuesCode) {
		this.surveyQuesCode = surveyQuesCode;
	}

	public String getSurveyQuesType() {
		return surveyQuesType;
	}

	public void setSurveyQuesType(String surveyQuesType) {
		this.surveyQuesType = surveyQuesType;
	}

	public String getSurveyQuesName() {
		return surveyQuesName;
	}

	public void setSurveyQuesName(String surveyQuesName) {
		this.surveyQuesName = surveyQuesName;
	}

	public String getSurveyQuesMust() {
		return surveyQuesMust;
	}

	public void setSurveyQuesMust(String surveyQuesMust) {
		this.surveyQuesMust = surveyQuesMust;
	}

	public String getSurveyQuesMulti() {
		return surveyQuesMulti;
	}

	public void setSurveyQuesMulti(String surveyQuesMulti) {
		this.surveyQuesMulti = surveyQuesMulti;
	}

	@Override
	public String toString() {
		return "SurveyQuesList [surveyQuesCode=" + surveyQuesCode + ", surveyQuesType=" + surveyQuesType
				+ ", surveyQuesName=" + surveyQuesName + ", surveyQuesMust=" + surveyQuesMust + ", surveyQuesMulti="
				+ surveyQuesMulti + "]";
	}
	

}
