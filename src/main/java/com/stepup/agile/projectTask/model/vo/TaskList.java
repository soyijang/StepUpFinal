package com.stepup.agile.projectTask.model.vo;

import com.stepup.agile.projectBacklog.model.vo.Sprint;
import com.stepup.agile.projectBacklog.model.vo.SprintHistory;
import com.stepup.agile.projectManage.model.vo.Project;
import com.stepup.agile.projectManage.model.vo.ProjectHistory;
import com.stepup.agile.userInfo.model.vo.Attachment;
import com.stepup.agile.userInfo.model.vo.Member;
import com.stepup.agile.userInfo.model.vo.Team;
import com.stepup.agile.userInfo.model.vo.UserProjectList;
import com.stepup.agile.userInfo.model.vo.UserTeamList;

public class TaskList implements java.io.Serializable{
	private int taskCode;
	private String taskCreateDate;
	private String taskLevel;
	private int sprintCode;
	private String taskCreateTime;
	private int taskMaster;
	private int taskUser;
	private int headTaskCode;
	
	private Member member;
	private Team team;
	private UserTeamList userTeamList;
	private UserProjectList userProjectList;
	private Project project;
	private ProjectHistory projectHistory;
	private Sprint sprint;
	private SprintHistory sprintHistory;
	private TaskCategory taskCategory;
	
	public TaskList() {}

	
	public TaskList(int taskCode, String taskCreateDate, String taskLevel, int sprintCode, String taskCreateTime,
			int taskMaster, int taskUser, int headTaskCode, Member member, Team team, UserTeamList userTeamList,
			UserProjectList userProjectList, Project project, ProjectHistory projectHistory, Sprint sprint,
			SprintHistory sprintHistory, TaskCategory taskCategory) {
		super();
		this.taskCode = taskCode;
		this.taskCreateDate = taskCreateDate;
		this.taskLevel = taskLevel;
		this.sprintCode = sprintCode;
		this.taskCreateTime = taskCreateTime;
		this.taskMaster = taskMaster;
		this.taskUser = taskUser;
		this.headTaskCode = headTaskCode;
		this.member = member;
		this.team = team;
		this.userTeamList = userTeamList;
		this.userProjectList = userProjectList;
		this.project = project;
		this.projectHistory = projectHistory;
		this.sprint = sprint;
		this.sprintHistory = sprintHistory;
		this.taskCategory = taskCategory;
	}

	public int getTaskCode() {
		return taskCode;
	}

	public void setTaskCode(int taskCode) {
		this.taskCode = taskCode;
	}

	public String getTaskCreateDate() {
		return taskCreateDate;
	}

	public void setTaskCreateDate(String taskCreateDate) {
		this.taskCreateDate = taskCreateDate;
	}

	public String getTaskLevel() {
		return taskLevel;
	}

	public void setTaskLevel(String taskLevel) {
		this.taskLevel = taskLevel;
	}

	public int getSprintCode() {
		return sprintCode;
	}

	public void setSprintCode(int sprintCode) {
		this.sprintCode = sprintCode;
	}

	public String getTaskCreateTime() {
		return taskCreateTime;
	}

	public void setTaskCreateTime(String taskCreateTime) {
		this.taskCreateTime = taskCreateTime;
	}

	public int getTaskMaster() {
		return taskMaster;
	}

	public void setTaskMaster(int taskMaster) {
		this.taskMaster = taskMaster;
	}

	public int getTaskUser() {
		return taskUser;
	}

	public void setTaskUser(int taskUser) {
		this.taskUser = taskUser;
	}

	public int getHeadTaskCode() {
		return headTaskCode;
	}

	public void setHeadTaskCode(int headTaskCode) {
		this.headTaskCode = headTaskCode;
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

	public ProjectHistory getProjectHistory() {
		return projectHistory;
	}

	public void setProjectHistory(ProjectHistory projectHistory) {
		this.projectHistory = projectHistory;
	}

	protected Team getTeam() {
		return team;
	}

	protected void setTeam(Team team) {
		this.team = team;
	}

	protected UserTeamList getUserTeamList() {
		return userTeamList;
	}

	protected void setUserTeamList(UserTeamList userTeamList) {
		this.userTeamList = userTeamList;
	}

	protected UserProjectList getUserProjectList() {
		return userProjectList;
	}

	protected void setUserProjectList(UserProjectList userProjectList) {
		this.userProjectList = userProjectList;
	}

	protected Sprint getSprint() {
		return sprint;
	}

	protected void setSprint(Sprint sprint) {
		this.sprint = sprint;
	}

	protected SprintHistory getSprintHistory() {
		return sprintHistory;
	}

	protected void setSprintHistory(SprintHistory sprintHistory) {
		this.sprintHistory = sprintHistory;
	}

	protected TaskCategory getTaskCategory() {
		return taskCategory;
	}

	protected void setTaskCategory(TaskCategory taskCategory) {
		this.taskCategory = taskCategory;
	}

	
	@Override
	public String toString() {
		return "TaskList [taskCode=" + taskCode + ", taskCreateDate=" + taskCreateDate + ", taskLevel=" + taskLevel
				+ ", sprintCode=" + sprintCode + ", taskCreateTime=" + taskCreateTime + ", taskMaster=" + taskMaster
				+ ", taskUser=" + taskUser + ", member=" + member + ", team=" + team + ", userTeamList=" + userTeamList
				+ ", userProjectList=" + userProjectList + ", project=" + project + ", projectHistory=" + projectHistory
				+ ", sprint=" + sprint + ", sprintHistory=" + sprintHistory + ", taskCategory=" + taskCategory + "]";
	}


}
