package com.stepup.agile.projectFeedback.model.vo;

import java.util.List;

public class SurveyReplyList implements java.io.Serializable{
	
	private int surveyQuesCode;
	private int surveyJoinCode;
	private String surveyReplyContent;
	private int surveyReplyCode;
	private int surveyCode;
	
	private List<SurveyReplyList> surveyReplyVOLists = null;
	
	public SurveyReplyList() {
		super();
	}

	
	public SurveyReplyList(int surveyQuesCode, int surveyJoinCode, String surveyReplyContent, int surveyReplyCode,
			int surveyCode, List<SurveyReplyList> surveyReplyVOLists) {
		super();
		this.surveyQuesCode = surveyQuesCode;
		this.surveyJoinCode = surveyJoinCode;
		this.surveyReplyContent = surveyReplyContent;
		this.surveyReplyCode = surveyReplyCode;
		this.surveyCode = surveyCode;
		this.surveyReplyVOLists = surveyReplyVOLists;
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

	public List<SurveyReplyList> getSurveyReplyVOLists() {
		return surveyReplyVOLists;
	}

	public void setSurveyReplyVOLists(List<SurveyReplyList> surveyReplyVOLists) {
		this.surveyReplyVOLists = surveyReplyVOLists;
	}

	@Override
	public String toString() {
		return "SurveyReplyList [surveyQuesCode=" + surveyQuesCode + ", surveyJoinCode=" + surveyJoinCode
				+ ", surveyReplyContent=" + surveyReplyContent + ", surveyReplyCode=" + surveyReplyCode
				+ ", surveyCode=" + surveyCode + ", surveyReplyVOLists=" + surveyReplyVOLists + "]";
	}

	

} 
