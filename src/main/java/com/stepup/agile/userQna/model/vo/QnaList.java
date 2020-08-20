package com.stepup.agile.userQna.model.vo;

public class QnaList implements java.io.Serializable{
	private int qnaCode;
	private String qnaType;
	private String qnaContent;
	private String qnaPrivacy;
	private int userCode;
	private String qnaReply;
	
	public QnaList() {}

	public QnaList(int qnaCode, String qnaType, String qnaContent, String qnaPrivacy, int userCode, String qnaReply) {
		super();
		this.qnaCode = qnaCode;
		this.qnaType = qnaType;
		this.qnaContent = qnaContent;
		this.qnaPrivacy = qnaPrivacy;
		this.userCode = userCode;
		this.qnaReply = qnaReply;
	}

	public int getQnaCode() {
		return qnaCode;
	}

	public void setQnaCode(int qnaCode) {
		this.qnaCode = qnaCode;
	}

	public String getQnaType() {
		return qnaType;
	}

	public void setQnaType(String qnaType) {
		this.qnaType = qnaType;
	}

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}

	public String getQnaPrivacy() {
		return qnaPrivacy;
	}

	public void setQnaPrivacy(String qnaPrivacy) {
		this.qnaPrivacy = qnaPrivacy;
	}

	public int getUserCode() {
		return userCode;
	}

	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}

	public String getQnaReply() {
		return qnaReply;
	}

	public void setQnaReply(String qnaReply) {
		this.qnaReply = qnaReply;
	}

	@Override
	public String toString() {
		return "QnaList [qnaCode=" + qnaCode + ", qnaType=" + qnaType + ", qnaContent=" + qnaContent + ", qnaPrivacy="
				+ qnaPrivacy + ", userCode=" + userCode + ", qnaReply=" + qnaReply + "]";
	}
	
	
	
}
