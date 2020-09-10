package com.stepup.agile.projectFeedback.model.vo;

import com.stepup.agile.projectBacklog.model.vo.Sprint;
import com.stepup.agile.projectBacklog.model.vo.SprintHistory;
import com.stepup.agile.userInfo.model.vo.Member;

public class SurveyList implements java.io.Serializable{
   
   private int surveyCode;
   private int sprintCode;
   private String surveyCreateDate;
   private String surveyCreateTime;
   private String surveyName;
   private String surveyIntro;
   private String surveyStatus;
   private String surveyStartDate;
   private String surveyEndDate;
   
   private Member member;
   private SurveyJoinList surveyJoinList;
   private Sprint sprint;
   private SprintHistory sprintHistory;
   
   public SurveyList() {
      super();
   }

   public SurveyList(int surveyCode, int sprintCode, String surveyCreateDate, String surveyCreateTime,
         String surveyName, String surveyIntro, String surveyStatus, String surveyStartDate, String surveyEndDate,
         Member member, SurveyJoinList surveyJoinList, Sprint sprint, SprintHistory sprintHistory) {
      super();
      this.surveyCode = surveyCode;
      this.sprintCode = sprintCode;
      this.surveyCreateDate = surveyCreateDate;
      this.surveyCreateTime = surveyCreateTime;
      this.surveyName = surveyName;
      this.surveyIntro = surveyIntro;
      this.surveyStatus = surveyStatus;
      this.surveyStartDate = surveyStartDate;
      this.surveyEndDate = surveyEndDate;
      this.member = member;
      this.surveyJoinList = surveyJoinList;
      this.sprint = sprint;
      this.sprintHistory = sprintHistory;
   }

   public int getSurveyCode() {
      return surveyCode;
   }

   public void setSurveyCode(int surveyCode) {
      this.surveyCode = surveyCode;
   }

   public int getSprintCode() {
      return sprintCode;
   }

   public void setSprintCode(int sprintCode) {
      this.sprintCode = sprintCode;
   }

   public String getSurveyCreateDate() {
      return surveyCreateDate;
   }

   public void setSurveyCreateDate(String surveyCreateDate) {
      this.surveyCreateDate = surveyCreateDate;
   }

   public String getSurveyCreateTime() {
      return surveyCreateTime;
   }

   public void setSurveyCreateTime(String surveyCreateTime) {
      this.surveyCreateTime = surveyCreateTime;
   }

   public String getSurveyName() {
      return surveyName;
   }

   public void setSurveyName(String surveyName) {
      this.surveyName = surveyName;
   }

   public String getSurveyIntro() {
      return surveyIntro;
   }

   public void setSurveyIntro(String surveyIntro) {
      this.surveyIntro = surveyIntro;
   }

   public String getSurveyStatus() {
      return surveyStatus;
   }

   public void setSurveyStatus(String surveyStatus) {
      this.surveyStatus = surveyStatus;
   }

   public String getSurveyStartDate() {
      return surveyStartDate;
   }

   public void setSurveyStartDate(String surveyStartDate) {
      this.surveyStartDate = surveyStartDate;
   }

   public String getSurveyEndDate() {
      return surveyEndDate;
   }

   public void setSurveyEndDate(String surveyEndDate) {
      this.surveyEndDate = surveyEndDate;
   }

   public Member getMember() {
      return member;
   }

   public void setMember(Member member) {
      this.member = member;
   }

   public SurveyJoinList getSurveyJoinList() {
      return surveyJoinList;
   }

   public void setSurveyJoinList(SurveyJoinList surveyJoinList) {
      this.surveyJoinList = surveyJoinList;
   }

   public Sprint getSprint() {
      return sprint;
   }

   public void setSprint(Sprint sprint) {
      this.sprint = sprint;
   }

   public SprintHistory getSprintHistory() {
      return sprintHistory;
   }

   public void setSprintHistory(SprintHistory sprintHistory) {
      this.sprintHistory = sprintHistory;
   }

   @Override
   public String toString() {
      return "SurveyList [surveyCode=" + surveyCode + ", sprintCode=" + sprintCode + ", surveyCreateDate="
            + surveyCreateDate + ", surveyCreateTime=" + surveyCreateTime + ", surveyName=" + surveyName
            + ", surveyIntro=" + surveyIntro + ", surveyStatus=" + surveyStatus + ", surveyStartDate="
            + surveyStartDate + ", surveyEndDate=" + surveyEndDate + ", member=" + member + ", surveyJoinList="
            + surveyJoinList + ", sprint=" + sprint + ", sprintHistory=" + sprintHistory + "]";
   }

   
}