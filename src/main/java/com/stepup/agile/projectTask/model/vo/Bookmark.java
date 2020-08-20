package com.stepup.agile.projectTask.model.vo;


public class Bookmark implements java.io.Serializable {
	private int bookmarkCode;
	private int userCode;
	private int taskCode;
	private String bookmarkDate;
	private String bookmarkTime;
	
	public Bookmark() {}
	
	public Bookmark(int bookmarkCode, int userCode, int taskCode, String bookmarkDate, String bookmarkTime) {
		super();
		this.bookmarkCode = bookmarkCode;
		this.userCode = userCode;
		this.taskCode = taskCode;
		this.bookmarkDate = bookmarkDate;
		this.bookmarkTime = bookmarkTime;
	}
	
	public int getBookmarkCode() {
		return bookmarkCode;
	}
	public void setBookmarkCode(int bookmarkCode) {
		this.bookmarkCode = bookmarkCode;
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
	public String getBookmarkDate() {
		return bookmarkDate;
	}
	public void setBookmarkDate(String bookmarkDate) {
		this.bookmarkDate = bookmarkDate;
	}
	public String getBookmarkTime() {
		return bookmarkTime;
	}
	public void setBookmarkTime(String bookmarkTime) {
		this.bookmarkTime = bookmarkTime;
	}
	
	@Override
	public String toString() {
		return "Bookmark [bookmarkCode=" + bookmarkCode + ", userCode=" + userCode + ", taskCode=" + taskCode
				+ ", bookmarkDate=" + bookmarkDate + ", bookmarkTime=" + bookmarkTime + "]";
	}
	
	
	
	
}
