package com.stepup.agile.projectTask.model.vo;

public class ReplyList implements java.io.Serializable {
	private int userCode;
	private int taskCode;
	private int replyCode;
	private String replyStatus;
	
	private ReplyList reply;
	
	public ReplyList() {}

	public ReplyList(int userCode, int taskCode, int replyCode, String replyStatus, ReplyList reply) {
		super();
		this.userCode = userCode;
		this.taskCode = taskCode;
		this.replyCode = replyCode;
		this.replyStatus = replyStatus;
		this.reply = reply;
	}

	public int getUserCode() {
		return userCode;
	}

	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}

	public int getTaskCode() {
		return taskCode;
	}

	public void setTaskCode(int taskCode) {
		this.taskCode = taskCode;
	}

	public int getReplyCode() {
		return replyCode;
	}

	public void setReplyCode(int replyCode) {
		this.replyCode = replyCode;
	}

	public String getReplyStatus() {
		return replyStatus;
	}

	public void setReplyStatus(String replyStatus) {
		this.replyStatus = replyStatus;
	}

	public ReplyList getReply() {
		return reply;
	}

	public void setReply(ReplyList reply) {
		this.reply = reply;
	}

	@Override
	public String toString() {
		return "ReplyList [userCode=" + userCode + ", taskCode=" + taskCode + ", replyCode=" + replyCode
				+ ", replyStatus=" + replyStatus + ", reply=" + reply + "]";
	}

}
