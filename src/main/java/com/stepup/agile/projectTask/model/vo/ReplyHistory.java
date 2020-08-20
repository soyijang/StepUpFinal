package com.stepup.agile.projectTask.model.vo;

public class ReplyHistory implements java.io.Serializable {
	private int replyHistCode;
	private String replyUpdateDate;
	private String replyUpdateTime;
	private String replyContents;
	private String replyType;
	private int replyCode;
	
	public ReplyHistory() {}

	public ReplyHistory(int replyHistCode, String replyUpdateDate, String replyUpdateTime, String replyContents,
			String replyType, int replyCode) {
		super();
		this.replyHistCode = replyHistCode;
		this.replyUpdateDate = replyUpdateDate;
		this.replyUpdateTime = replyUpdateTime;
		this.replyContents = replyContents;
		this.replyType = replyType;
		this.replyCode = replyCode;
	}

	public int getReplyHistCode() {
		return replyHistCode;
	}

	public void setReplyHistCode(int replyHistCode) {
		this.replyHistCode = replyHistCode;
	}

	public String getReplyUpdateDate() {
		return replyUpdateDate;
	}

	public void setReplyUpdateDate(String replyUpdateDate) {
		this.replyUpdateDate = replyUpdateDate;
	}

	public String getReplyUpdateTime() {
		return replyUpdateTime;
	}

	public void setReplyUpdateTime(String replyUpdateTime) {
		this.replyUpdateTime = replyUpdateTime;
	}

	public String getReplyContents() {
		return replyContents;
	}

	public void setReplyContents(String replyContents) {
		this.replyContents = replyContents;
	}

	public String getReplyType() {
		return replyType;
	}

	public void setReplyType(String replyType) {
		this.replyType = replyType;
	}

	public int getReplyCode() {
		return replyCode;
	}

	public void setReplyCode(int replyCode) {
		this.replyCode = replyCode;
	}

	@Override
	public String toString() {
		return "ReplyHistory [replyHistCode=" + replyHistCode + ", replyUpdateDate=" + replyUpdateDate
				+ ", replyUpdateTime=" + replyUpdateTime + ", replyContents=" + replyContents + ", replyType="
				+ replyType + ", replyCode=" + replyCode + "]";
	}
}
