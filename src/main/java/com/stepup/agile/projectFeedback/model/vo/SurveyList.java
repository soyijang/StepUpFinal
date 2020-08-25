package com.stepup.agile.projectFeedback.model.vo;

public class SurveyList implements java.io.Serializable{
	
	private int surveyCode;
	private int sprintCode;
	private String surveyCreateDate;
	private String surveyCreateTime;
	private String surveyName;
	private String surveyIntro;
	private String surveyStatus;
	private String surveyStartDate;
	private String surveyEndDate;

	public SurveyList() {
		super();
	}

	public SurveyList(int surveyCode, int sprintCode, String surveyCreateDate, String surveyCreateTime,
			String surveyName, String surveyIntro, String surveyStatus, String surveyStartDate, String surveyEndDate) {
		super();
		this.surveyCode = surveyCode;
		this.sprintCode = sprintCode;
		this.surveyCreateDate = surveyCreateDate;
		this.surveyCreateTime = surveyCreateTime;
		this.surveyName = surveyName;
		this.surveyIntro = surveyIntro;
		this.surveyStatus = surveyStatus;
		this.surveyStartDate = surveyStartDate;
		this.surveyEndDate = surveyEndDate;
	}

	public int getSurveyCode() {
		return surveyCode;
	}

	public void setSurveyCode(int surveyCode) {
		this.surveyCode = surveyCode;
	}

	public int getSprintCode() {
		return sprintCode;
	}

	public void setSprintCode(int sprintCode) {
		this.sprintCode = sprintCode;
	}

	public String getSurveyCreateDate() {
		return surveyCreateDate;
	}

	public void setSurveyCreateDate(String surveyCreateDate) {
		this.surveyCreateDate = surveyCreateDate;
	}

	public String getSurveyCreateTime() {
		return surveyCreateTime;
	}

	public void setSurveyCreateTime(String surveyCreateTime) {
		this.surveyCreateTime = surveyCreateTime;
	}

	public String getSurveyName() {
		return surveyName;
	}

	public void setSurveyName(String surveyName) {
		this.surveyName = surveyName;
	}

	public String getSurveyIntro() {
		return surveyIntro;
	}

	public void setSurveyIntro(String surveyIntro) {
		this.surveyIntro = surveyIntro;
	}

	public String getSurveyStatus() {
		return surveyStatus;
	}

	public void setSurveyStatus(String surveyStatus) {
		this.surveyStatus = surveyStatus;
	}

	public String getSurveyStartDate() {
		return surveyStartDate;
	}

	public void setSurveyStartDate(String surveyStartDate) {
		this.surveyStartDate = surveyStartDate;
	}

	public String getSurveyEndDate() {
		return surveyEndDate;
	}

	public void setSurveyEndDate(String surveyEndDate) {
		this.surveyEndDate = surveyEndDate;
	}

	@Override
	public String toString() {
		return "SurveyList [surveyCode=" + surveyCode + ", sprintCode=" + sprintCode + ", surveyCreateDate="
				+ surveyCreateDate + ", surveyCreateTime=" + surveyCreateTime + ", surveyName=" + surveyName
				+ ", surveyIntro=" + surveyIntro + ", surveyStatus=" + surveyStatus + ", surveyStartDate="
				+ surveyStartDate + ", surveyEndDate=" + surveyEndDate + "]";
	}

	
	
	
}
