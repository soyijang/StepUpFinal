package com.stepup.agile.projectBacklog.model.vo;

import com.stepup.agile.projectManage.model.vo.Project;
import com.stepup.agile.projectTask.model.vo.TaskCategory;
import com.stepup.agile.projectTask.model.vo.TaskHistory;
import com.stepup.agile.projectTask.model.vo.TaskList;
import com.stepup.agile.userInfo.model.vo.Member;
import com.stepup.agile.userInfo.model.vo.UserProjectList;
import com.stepup.agile.userInfo.model.vo.UserTeamList;

public class SprintHistory implements java.io.Serializable{

	private String sprintHistUpdateDate;
	private String sprintName;
	private String sprintType;
	private String sprintExpectPeriod;
	private int sprintHistCode;
	private int sprintCode;
	private String sprintHistUpdateTime;
	private String sprintIntro;
	private String sprintStatus;
	private int sprintTaskCount;
	private int userProjectCode;
	private String sprintTypeYn;
	
	private UserProjectList userProjectList;
	private UserTeamList userTeamList;
	private Member member;
	private Sprint sprint;
	private Project project;
	private TaskCategory taskCategory;
	private TaskList taskList;
	private TaskHistory taskHistory;
	
	
	public SprintHistory() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
	public SprintHistory(String sprintHistUpdateDate, String sprintName, String sprintType, String sprintExpectPeriod,
			int sprintHistCode, int sprintCode, String sprintHistUpdateTime, String sprintIntro, String sprintStatus,
			int sprintTaskCount, int userProjectCode, String sprintTypeYn, UserProjectList userProjectList,
			UserTeamList userTeamList, Member member, Sprint sprint, Project project, TaskCategory taskCategory,
			TaskList taskList, TaskHistory taskHistory) {
		super();
		this.sprintHistUpdateDate = sprintHistUpdateDate;
		this.sprintName = sprintName;
		this.sprintType = sprintType;
		this.sprintExpectPeriod = sprintExpectPeriod;
		this.sprintHistCode = sprintHistCode;
		this.sprintCode = sprintCode;
		this.sprintHistUpdateTime = sprintHistUpdateTime;
		this.sprintIntro = sprintIntro;
		this.sprintStatus = sprintStatus;
		this.sprintTaskCount = sprintTaskCount;
		this.userProjectCode = userProjectCode;
		this.sprintTypeYn = sprintTypeYn;
		this.userProjectList = userProjectList;
		this.userTeamList = userTeamList;
		this.member = member;
		this.sprint = sprint;
		this.project = project;
		this.taskCategory = taskCategory;
		this.taskList = taskList;
		this.taskHistory = taskHistory;
	}



	public int getUserProjectCode() {
		return userProjectCode;
	}
	public void setUserProjectCode(int userProjectCode) {
		this.userProjectCode = userProjectCode;
	}

	public String getSprintHistUpdateDate() {
		return sprintHistUpdateDate;
	}


	public void setSprintHistUpdateDate(String sprintHistUpdateDate) {
		this.sprintHistUpdateDate = sprintHistUpdateDate;
	}


	public String getSprintName() {
		return sprintName;
	}


	public void setSprintName(String sprintName) {
		this.sprintName = sprintName;
	}


	public String getSprintType() {
		return sprintType;
	}


	public void setSprintType(String sprintType) {
		this.sprintType = sprintType;
	}


	public String getSprintExpectPeriod() {
		return sprintExpectPeriod;
	}


	public void setSprintExpectPeriod(String sprintExpectPeriod) {
		this.sprintExpectPeriod = sprintExpectPeriod;
	}


	public int getSprintHistCode() {
		return sprintHistCode;
	}


	public void setSprintHistCode(int sprintHistCode) {
		this.sprintHistCode = sprintHistCode;
	}


	public int getSprintCode() {
		return sprintCode;
	}


	public void setSprintCode(int sprintCode) {
		this.sprintCode = sprintCode;
	}


	public String getSprintHistUpdateTime() {
		return sprintHistUpdateTime;
	}


	public void setSprintHistUpdateTime(String sprintHistUpdateTime) {
		this.sprintHistUpdateTime = sprintHistUpdateTime;
	}


	public String getSprintIntro() {
		return sprintIntro;
	}


	public void setSprintIntro(String sprintIntro) {
		this.sprintIntro = sprintIntro;
	}


	public String getSprintStatus() {
		return sprintStatus;
	}


	public void setSprintStatus(String sprintStatus) {
		this.sprintStatus = sprintStatus;
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


	public Sprint getSprint() {
		return sprint;
	}


	public void setSprint(Sprint sprint) {
		this.sprint = sprint;
	}


	public Project getProject() {
		return project;
	}


	public void setProject(Project project) {
		this.project = project;
	}


	public TaskCategory getTaskCategory() {
		return taskCategory;
	}


	public void setTaskCategory(TaskCategory taskCategory) {
		this.taskCategory = taskCategory;
	}


	public TaskList getTaskList() {
		return taskList;
	}


	public void setTaskList(TaskList taskList) {
		this.taskList = taskList;
	}


	public TaskHistory getTaskHistory() {
		return taskHistory;
	}


	public void setTaskHistory(TaskHistory taskHistory) {
		this.taskHistory = taskHistory;
	}


	public int getSprintTaskCount() {
		return sprintTaskCount;
	}


	public void setSprintTaskCount(int sprintTaskCount) {
		this.sprintTaskCount = sprintTaskCount;
	}



	public String getSprintTypeYn() {
		return sprintTypeYn;
	}



	public void setSprintTypeYn(String sprintTypeYn) {
		this.sprintTypeYn = sprintTypeYn;
	}



	@Override
	public String toString() {
		return "SprintHistory [sprintHistUpdateDate=" + sprintHistUpdateDate + ", sprintName=" + sprintName
				+ ", sprintType=" + sprintType + ", sprintExpectPeriod=" + sprintExpectPeriod + ", sprintHistCode="
				+ sprintHistCode + ", sprintCode=" + sprintCode + ", sprintHistUpdateTime=" + sprintHistUpdateTime
				+ ", sprintIntro=" + sprintIntro + ", sprintStatus=" + sprintStatus + ", sprintTaskCount="
				+ sprintTaskCount + ", userProjectCode=" + userProjectCode + ", sprintTypeYn=" + sprintTypeYn
				+ ", userProjectList=" + userProjectList + ", userTeamList=" + userTeamList + ", member=" + member
				+ ", sprint=" + sprint + ", project=" + project + ", taskCategory=" + taskCategory + ", taskList="
				+ taskList + ", taskHistory=" + taskHistory + "]";
	}


}
