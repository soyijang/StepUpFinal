package com.stepup.agile.userInfo.model.vo;

public class AlertList implements java.io.Serializable{
	private int alertCode;
	private String alertCheckYn;
	private String alertCategory;
	private String alertHistoryCode;
	
	public AlertList() {}

	public AlertList(int alertCode, String alertCheckYn, String alertCategory, String alertHistoryCode) {
		super();
		this.alertCode = alertCode;
		this.alertCheckYn = alertCheckYn;
		this.alertCategory = alertCategory;
		this.alertHistoryCode = alertHistoryCode;
	}

	public int getAlertCode() {
		return alertCode;
	}

	public void setAlertCode(int alertCode) {
		this.alertCode = alertCode;
	}

	public String getAlertCheckYn() {
		return alertCheckYn;
	}

	public void setAlertCheckYn(String alertCheckYn) {
		this.alertCheckYn = alertCheckYn;
	}

	public String getAlertCategory() {
		return alertCategory;
	}

	public void setAlertCategory(String alertCategory) {
		this.alertCategory = alertCategory;
	}

	public String getAlertHistoryCode() {
		return alertHistoryCode;
	}

	public void setAlertHistoryCode(String alertHistoryCode) {
		this.alertHistoryCode = alertHistoryCode;
	}

	@Override
	public String toString() {
		return "AlertList [alertCode=" + alertCode + ", alertCheckYn=" + alertCheckYn + ", alertCategory="
				+ alertCategory + ", alertHistoryCode=" + alertHistoryCode + "]";
	}
	
}
