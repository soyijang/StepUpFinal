package com.stepup.agile.userQna.model.vo;

public class QnaReply implements java.io.Serializable{
	private int qnaCode;
	private String qnaReplyContent;
	private String qnaReplyDate;
	private String qnaReplyTime;
	private int userCode;
	
	public QnaReply() {}

	public QnaReply(int qnaCode, String qnaReplyContent, String qnaReplyDate, String qnaReplyTime, int userCode) {
		super();
		this.qnaCode = qnaCode;
		this.qnaReplyContent = qnaReplyContent;
		this.qnaReplyDate = qnaReplyDate;
		this.qnaReplyTime = qnaReplyTime;
		this.userCode = userCode;
	}

	public int getQnaCode() {
		return qnaCode;
	}

	public void setQnaCode(int qnaCode) {
		this.qnaCode = qnaCode;
	}

	public String getQnaReplyContent() {
		return qnaReplyContent;
	}

	public void setQnaReplyContent(String qnaReplyContent) {
		this.qnaReplyContent = qnaReplyContent;
	}

	public String getQnaReplyDate() {
		return qnaReplyDate;
	}

	public void setQnaReplyDate(String qnaReplyDate) {
		this.qnaReplyDate = qnaReplyDate;
	}

	public String getQnaReplyTime() {
		return qnaReplyTime;
	}

	public void setQnaReplyTime(String qnaReplyTime) {
		this.qnaReplyTime = qnaReplyTime;
	}

	public int getUserCode() {
		return userCode;
	}

	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}

	@Override
	public String toString() {
		return "QnaReply [qnaCode=" + qnaCode + ", qnaReplyContent=" + qnaReplyContent + ", qnaReplyDate="
				+ qnaReplyDate + ", qnaReplyTime=" + qnaReplyTime + ", userCode=" + userCode + "]";
	}
	
	
}
