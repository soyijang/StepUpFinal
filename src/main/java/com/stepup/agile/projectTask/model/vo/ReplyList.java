package com.stepup.agile.projectTask.model.vo;

import com.stepup.agile.userInfo.model.vo.Member;

public class ReplyList implements java.io.Serializable {
	private int userCode;
	private int taskCode;
	private int replyCode;
	private String replyStatus;
	
	public ReplyList() {}

	public ReplyList(int userCode, int taskCode, int replyCode, String replyStatus) {
		super();
		this.userCode = userCode;
		this.taskCode = taskCode;
		this.replyCode = replyCode;
		this.replyStatus = replyStatus;
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

	@Override
	public String toString() {
		return "ReplyList [userCode=" + userCode + ", taskCode=" + taskCode + ", replyCode=" + replyCode
				+ ", replyStatus=" + replyStatus + "]";
	}
}
