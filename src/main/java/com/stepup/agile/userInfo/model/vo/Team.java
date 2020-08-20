package com.stepup.agile.userInfo.model.vo;

public class Team implements java.io.Serializable {
	private int teamCode;
	private String teamName;
	
	public Team() {}

	public Team(int teamCode, String teamName) {
		super();
		this.teamCode = teamCode;
		this.teamName = teamName;
	}

	public int getTeamCode() {
		return teamCode;
	}

	public void setTeamCode(int teamCode) {
		this.teamCode = teamCode;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	@Override
	public String toString() {
		return "Team [teamCode=" + teamCode + ", teamName=" + teamName + "]";
	}
}
