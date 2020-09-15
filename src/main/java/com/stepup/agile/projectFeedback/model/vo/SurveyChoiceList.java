package com.stepup.agile.projectFeedback.model.vo;

import java.util.List;

public class SurveyChoiceList implements java.io.Serializable{
	
	private int surveyQuesCode;
	private int surveyChoiceNum;
	private String surveyChoiceContent;
	private int surveyCode;
	
	private List<SurveyChoiceList> surveyChoiceVOLists = null;
	
	private SurveyQuesList surveyQuesList;
	private SurveyQuesMatch surveyQuesMatch;
	
	public SurveyChoiceList() {
		super();
	}

	public SurveyChoiceList(int surveyQuesCode, int surveyChoiceNum, String surveyChoiceContent, int surveyCode,
			List<SurveyChoiceList> surveyChoiceVOLists, SurveyQuesList surveyQuesList,
			SurveyQuesMatch surveyQuesMatch) {
		super();
		this.surveyQuesCode = surveyQuesCode;
		this.surveyChoiceNum = surveyChoiceNum;
		this.surveyChoiceContent = surveyChoiceContent;
		this.surveyCode = surveyCode;
		this.surveyChoiceVOLists = surveyChoiceVOLists;
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

	public int getSurveyCode() {
		return surveyCode;
	}

	public void setSurveyCode(int surveyCode) {
		this.surveyCode = surveyCode;
	}

	public List<SurveyChoiceList> getSurveyChoiceVOLists() {
		return surveyChoiceVOLists;
	}

	public void setSurveyChoiceVOLists(List<SurveyChoiceList> surveyChoiceVOLists) {
		this.surveyChoiceVOLists = surveyChoiceVOLists;
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
				+ ", surveyChoiceContent=" + surveyChoiceContent + ", surveyCode=" + surveyCode
				+ ", surveyChoiceVOLists=" + surveyChoiceVOLists + ", surveyQuesList=" + surveyQuesList
				+ ", surveyQuesMatch=" + surveyQuesMatch + "]";
	}

	
}
