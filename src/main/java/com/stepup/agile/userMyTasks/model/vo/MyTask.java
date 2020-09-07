package com.stepup.agile.userMyTasks.model.vo;

import com.stepup.agile.projectManage.model.vo.Project;
import com.stepup.agile.userInfo.model.vo.Member;
import com.stepup.agile.userInfo.model.vo.UserProjectList;
import com.stepup.agile.userInfo.model.vo.UserTeamList;

public class MyTask implements java.io.Serializable{
	
	private int myTasksCode;
	private String myTaskscontents;
	private String myTasksstartDate;
	private String myTasksstartTime;
	private String myTasksendDate;
	private String myTasksendTime;
	private String myTasksenrollDate;
	private String myTasksenrollTime;
	private int userProjectCode;
	private String myTasksShareYN;
	private String myTasksTodoYN;
	
	
	private UserProjectList userProjectList;
	private UserTeamList userTeamList;
	private Member member;
	private Project project;
	private MyTaskShare myTaskShare;
	
	public MyTask() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MyTask(int myTasksCode, String myTaskscontents, String myTasksstartDate, String myTasksstartTime,
			String myTasksendDate, String myTasksendTime, String myTasksenrollDate, String myTasksenrollTime,
			int userProjectCode, String myTasksShareYN, String myTasksTodoYN, UserProjectList userProjectList,
			UserTeamList userTeamList, Member member, Project project, MyTaskShare myTaskShare) {
		super();
		this.myTasksCode = myTasksCode;
		this.myTaskscontents = myTaskscontents;
		this.myTasksstartDate = myTasksstartDate;
		this.myTasksstartTime = myTasksstartTime;
		this.myTasksendDate = myTasksendDate;
		this.myTasksendTime = myTasksendTime;
		this.myTasksenrollDate = myTasksenrollDate;
		this.myTasksenrollTime = myTasksenrollTime;
		this.userProjectCode = userProjectCode;
		this.myTasksShareYN = myTasksShareYN;
		this.myTasksTodoYN = myTasksTodoYN;
		this.userProjectList = userProjectList;
		this.userTeamList = userTeamList;
		this.member = member;
		this.project = project;
		this.myTaskShare = myTaskShare;
	}

	public int getMyTasksCode() {
		return myTasksCode;
	}

	public void setMyTasksCode(int myTasksCode) {
		this.myTasksCode = myTasksCode;
	}

	public String getMyTaskscontents() {
		return myTaskscontents;
	}

	public void setMyTaskscontents(String myTaskscontents) {
		this.myTaskscontents = myTaskscontents;
	}

	public String getMyTasksstartDate() {
		return myTasksstartDate;
	}

	public void setMyTasksstartDate(String myTasksstartDate) {
		this.myTasksstartDate = myTasksstartDate;
	}

	public String getMyTasksstartTime() {
		return myTasksstartTime;
	}

	public void setMyTasksstartTime(String myTasksstartTime) {
		this.myTasksstartTime = myTasksstartTime;
	}

	public String getMyTasksendDate() {
		return myTasksendDate;
	}

	public void setMyTasksendDate(String myTasksendDate) {
		this.myTasksendDate = myTasksendDate;
	}

	public String getMyTasksendTime() {
		return myTasksendTime;
	}

	public void setMyTasksendTime(String myTasksendTime) {
		this.myTasksendTime = myTasksendTime;
	}

	public String getMyTasksenrollDate() {
		return myTasksenrollDate;
	}

	public void setMyTasksenrollDate(String myTasksenrollDate) {
		this.myTasksenrollDate = myTasksenrollDate;
	}

	public String getMyTasksenrollTime() {
		return myTasksenrollTime;
	}

	public void setMyTasksenrollTime(String myTasksenrollTime) {
		this.myTasksenrollTime = myTasksenrollTime;
	}

	public int getUserProjectCode() {
		return userProjectCode;
	}

	public void setUserProjectCode(int userProjectCode) {
		this.userProjectCode = userProjectCode;
	}

	public String getMyTasksShareYN() {
		return myTasksShareYN;
	}

	public void setMyTasksShareYN(String myTasksShareYN) {
		this.myTasksShareYN = myTasksShareYN;
	}

	public String getMyTasksTodoYN() {
		return myTasksTodoYN;
	}

	public void setMyTasksTodoYN(String myTasksTodoYN) {
		this.myTasksTodoYN = myTasksTodoYN;
	}

	public UserProjectList getUserProjectList() {
		return userProjectList;
	}

	public void setUserProjectList(UserProjectList userProjectList) {
		this.userProjectList = userProjectList;
	}

	public UserTeamList getUserTeamList() {
		return userTeamList;
	}

	public void setUserTeamList(UserTeamList userTeamList) {
		this.userTeamList = userTeamList;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public MyTaskShare getMyTaskShare() {
		return myTaskShare;
	}

	public void setMyTaskShare(MyTaskShare myTaskShare) {
		this.myTaskShare = myTaskShare;
	}

	@Override
	public String toString() {
		return "MyTask [myTasksCode=" + myTasksCode + ", myTaskscontents=" + myTaskscontents + ", myTasksstartDate="
				+ myTasksstartDate + ", myTasksstartTime=" + myTasksstartTime + ", myTasksendDate=" + myTasksendDate
				+ ", myTasksendTime=" + myTasksendTime + ", myTasksenrollDate=" + myTasksenrollDate
				+ ", myTasksenrollTime=" + myTasksenrollTime + ", userProjectCode=" + userProjectCode
				+ ", myTasksShareYN=" + myTasksShareYN + ", myTasksTodoYN=" + myTasksTodoYN + ", userProjectList="
				+ userProjectList + ", userTeamList=" + userTeamList + ", member=" + member + ", project=" + project
				+ ", myTaskShare=" + myTaskShare + "]";
	}

	
}
