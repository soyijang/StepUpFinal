package com.stepup.agile.userInfo.model.vo;

import com.stepup.agile.projectManage.model.vo.Project;
import com.stepup.agile.projectTask.model.vo.Bookmark;
import com.stepup.agile.projectTask.model.vo.TaskHistory;
import com.stepup.agile.projectTask.model.vo.TaskList;

public class Member implements java.io.Serializable {
   private String userEmail;
   private String userPwd;
   private String userName;
   private int userCode;
   private String userPhone;
   private String userCompName;
   private String userCompDept;
   private String userCompJob;
   private String userEnrollDate;
   private String userStatus;
   private String userManagerYn;
   private String userEnrollTime;
   
   private String verified;
   private int attachCode;
   private String projectName;
   
   private UserTeamList userTeamList;
   private Attachment attachment;
   private Project project;
   private UserProjectList userProjectList;

   private TaskHistory taskHistory;
   private Bookmark bookMark;
   private TaskList taskList;
   
   public Member() {}

   public Member(String userEmail, String userPwd, String userName, int userCode, String userPhone,
         String userCompName, String userCompDept, String userCompJob, String userEnrollDate, String userStatus,
         String userManagerYn, String userEnrollTime, String verified, int attachCode, String projectName,
         UserTeamList userTeamList, Attachment attachment, Project project, UserProjectList userProjectList,
         TaskHistory taskHistory, Bookmark bookMark, TaskList taskList) {
      super();
      this.userEmail = userEmail;
      this.userPwd = userPwd;
      this.userName = userName;
      this.userCode = userCode;
      this.userPhone = userPhone;
      this.userCompName = userCompName;
      this.userCompDept = userCompDept;
      this.userCompJob = userCompJob;
      this.userEnrollDate = userEnrollDate;
      this.userStatus = userStatus;
      this.userManagerYn = userManagerYn;
      this.userEnrollTime = userEnrollTime;
      this.verified = verified;
      this.attachCode = attachCode;
      this.projectName = projectName;
      this.userTeamList = userTeamList;
      this.attachment = attachment;
      this.project = project;
      this.userProjectList = userProjectList;
      this.taskHistory = taskHistory;
      this.bookMark = bookMark;
      this.taskList = taskList;
   }

   public String getUserEmail() {
      return userEmail;
   }

   public void setUserEmail(String userEmail) {
      this.userEmail = userEmail;
   }

   public String getUserPwd() {
      return userPwd;
   }

   public void setUserPwd(String userPwd) {
      this.userPwd = userPwd;
   }

   public String getUserName() {
      return userName;
   }

   public void setUserName(String userName) {
      this.userName = userName;
   }

   public int getUserCode() {
      return userCode;
   }

   public void setUserCode(int userCode) {
      this.userCode = userCode;
   }

   public String getUserPhone() {
      return userPhone;
   }

   public void setUserPhone(String userPhone) {
      this.userPhone = userPhone;
   }

   public String getUserCompName() {
      return userCompName;
   }

   public void setUserCompName(String userCompName) {
      this.userCompName = userCompName;
   }

   public String getUserCompDept() {
      return userCompDept;
   }

   public void setUserCompDept(String userCompDept) {
      this.userCompDept = userCompDept;
   }

   public String getUserCompJob() {
      return userCompJob;
   }

   public void setUserCompJob(String userCompJob) {
      this.userCompJob = userCompJob;
   }

   public String getUserEnrollDate() {
      return userEnrollDate;
   }

   public void setUserEnrollDate(String userEnrollDate) {
      this.userEnrollDate = userEnrollDate;
   }

   public String getUserStatus() {
      return userStatus;
   }

   public void setUserStatus(String userStatus) {
      this.userStatus = userStatus;
   }

   public String getUserManagerYn() {
      return userManagerYn;
   }

   public void setUserManagerYn(String userManagerYn) {
      this.userManagerYn = userManagerYn;
   }

   public String getUserEnrollTime() {
      return userEnrollTime;
   }

   public void setUserEnrollTime(String userEnrollTime) {
      this.userEnrollTime = userEnrollTime;
   }

   public String getVerified() {
      return verified;
   }

   public void setVerified(String verified) {
      this.verified = verified;
   }

   public int getAttachCode() {
      return attachCode;
   }

   public void setAttachCode(int attachCode) {
      this.attachCode = attachCode;
   }

   public String getProjectName() {
      return projectName;
   }

   public void setProjectName(String projectName) {
      this.projectName = projectName;
   }

   public UserTeamList getUserTeamList() {
      return userTeamList;
   }

   public void setUserTeamList(UserTeamList userTeamList) {
      this.userTeamList = userTeamList;
   }

   public Attachment getAttachment() {
      return attachment;
   }

   public void setAttachment(Attachment attachment) {
      this.attachment = attachment;
   }

   public Project getProject() {
      return project;
   }

   public void setProject(Project project) {
      this.project = project;
   }

   public UserProjectList getUserProjectList() {
      return userProjectList;
   }

   public void setUserProjectList(UserProjectList userProjectList) {
      this.userProjectList = userProjectList;
   }

   public TaskHistory getTaskHistory() {
      return taskHistory;
   }

   public void setTaskHistory(TaskHistory taskHistory) {
      this.taskHistory = taskHistory;
   }

   public Bookmark getBookMark() {
      return bookMark;
   }

   public void setBookMark(Bookmark bookMark) {
      this.bookMark = bookMark;
   }

   public TaskList getTaskList() {
      return taskList;
   }

   public void setTaskList(TaskList taskList) {
      this.taskList = taskList;
   }

   @Override
   public String toString() {
      return "Member [userEmail=" + userEmail + ", userPwd=" + userPwd + ", userName=" + userName + ", userCode="
            + userCode + ", userPhone=" + userPhone + ", userCompName=" + userCompName + ", userCompDept="
            + userCompDept + ", userCompJob=" + userCompJob + ", userEnrollDate=" + userEnrollDate + ", userStatus="
            + userStatus + ", userManagerYn=" + userManagerYn + ", userEnrollTime=" + userEnrollTime + ", verified="
            + verified + ", attachCode=" + attachCode + ", projectName=" + projectName + ", userTeamList="
            + userTeamList + ", attachment=" + attachment + ", project=" + project + ", userProjectList="
            + userProjectList + ", taskHistory=" + taskHistory + ", bookMark=" + bookMark + ", taskList=" + taskList
            + "]";
   }
   
}