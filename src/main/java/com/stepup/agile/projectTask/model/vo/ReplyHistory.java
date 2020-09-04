package com.stepup.agile.projectTask.model.vo;

import com.stepup.agile.userInfo.model.vo.Attachment;
import com.stepup.agile.userInfo.model.vo.Member;

public class ReplyHistory implements java.io.Serializable {
	private int replyHistCode;
	private String replyUpdateDate;
	private String replyUpdateTime;
	private String replyContents;
	private String replyType;
	private int replyCode;
	
	private Member member;
	private ReplyList replyList;
	private Attachment attachment;
	private TaskList taskList;
	
	public ReplyHistory() {}

	public ReplyHistory(int replyHistCode, String replyUpdateDate, String replyUpdateTime, String replyContents,
			String replyType, int replyCode, Member member, ReplyList replyList, Attachment attachment,
			TaskList taskList) {
		super();
		this.replyHistCode = replyHistCode;
		this.replyUpdateDate = replyUpdateDate;
		this.replyUpdateTime = replyUpdateTime;
		this.replyContents = replyContents;
		this.replyType = replyType;
		this.replyCode = replyCode;
		this.member = member;
		this.replyList = replyList;
		this.attachment = attachment;
		this.taskList = taskList;
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

	
	public Member getMember() {
		return member;
	}


	public void setMember(Member member) {
		this.member = member;
	}

	public ReplyList getReplyList() {
		return replyList;
	}

	public void setReplyList(ReplyList replyList) {
		this.replyList = replyList;
	}

	
	public Attachment getAttachment() {
		return attachment;
	}

	public void setAttachment(Attachment attachment) {
		this.attachment = attachment;
	}
	
	public TaskList getTaskList() {
		return taskList;
	}

	public void setTaskList(TaskList taskList) {
		this.taskList = taskList;
	}

	@Override
	public String toString() {
		return "ReplyHistory [replyHistCode=" + replyHistCode + ", replyUpdateDate=" + replyUpdateDate
				+ ", replyUpdateTime=" + replyUpdateTime + ", replyContents=" + replyContents + ", replyType="
				+ replyType + ", replyCode=" + replyCode + ", member=" + member + ", replyList=" + replyList
				+ ", attachment=" + attachment + ", taskList=" + taskList + "]";
	}

}
