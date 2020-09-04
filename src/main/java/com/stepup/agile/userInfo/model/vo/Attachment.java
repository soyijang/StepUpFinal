package com.stepup.agile.userInfo.model.vo;

public class Attachment implements java.io.Serializable {
   private int attachCode;
   private String attachPath;
   private String attachOriginName;
   private String attachChangeName;
   private String attachUploadDate;
   private String attachUploadTime;
   private int taskHistCode;
   private int userCode;
   private String attachType;
   private String thumbnailPath;
   private String attachSize;
   
   public Attachment() {}

   public Attachment(int attachCode, String attachPath, String attachOriginName, String attachChangeName,
         String attachUploadDate, String attachUploadTime, int taskHistCode, int userCode, String attachType,
         String thumbnailPath, String attachSize) {
      super();
      this.attachCode = attachCode;
      this.attachPath = attachPath;
      this.attachOriginName = attachOriginName;
      this.attachChangeName = attachChangeName;
      this.attachUploadDate = attachUploadDate;
      this.attachUploadTime = attachUploadTime;
      this.taskHistCode = taskHistCode;
      this.userCode = userCode;
      this.attachType = attachType;
      this.thumbnailPath = thumbnailPath;
      this.attachSize = attachSize;
   }

   public int getAttachCode() {
      return attachCode;
   }

   public void setAttachCode(int attachCode) {
      this.attachCode = attachCode;
   }

   public String getAttachPath() {
      return attachPath;
   }

   public void setAttachPath(String attachPath) {
      this.attachPath = attachPath;
   }

   public String getAttachOriginName() {
      return attachOriginName;
   }

   public void setAttachOriginName(String attachOriginName) {
      this.attachOriginName = attachOriginName;
   }

   public String getAttachChangeName() {
      return attachChangeName;
   }

   public void setAttachChangeName(String attachChangeName) {
      this.attachChangeName = attachChangeName;
   }

   public String getAttachUploadDate() {
      return attachUploadDate;
   }

   public void setAttachUploadDate(String attachUploadDate) {
      this.attachUploadDate = attachUploadDate;
   }

   public String getAttachUploadTime() {
      return attachUploadTime;
   }

   public void setAttachUploadTime(String attachUploadTime) {
      this.attachUploadTime = attachUploadTime;
   }

   public int getTaskHistCode() {
      return taskHistCode;
   }

   public void setTaskHistCode(int taskHistCode) {
      this.taskHistCode = taskHistCode;
   }

   public int getUserCode() {
      return userCode;
   }

   public void setUserCode(int userCode) {
      this.userCode = userCode;
   }

   public String getAttachType() {
      return attachType;
   }

   public void setAttachType(String attachType) {
      this.attachType = attachType;
   }

   public String getThumbnailPath() {
      return thumbnailPath;
   }

   public void setThumbnailPath(String thumbnailPath) {
      this.thumbnailPath = thumbnailPath;
   }

   public String getAttachSize() {
      return attachSize;
   }

   public void setAttachSize(String attachSize) {
      this.attachSize = attachSize;
   }

   @Override
   public String toString() {
      return "Attachment [attachCode=" + attachCode + ", attachPath=" + attachPath + ", attachOriginName="
            + attachOriginName + ", attachChangeName=" + attachChangeName + ", attachUploadDate=" + attachUploadDate
            + ", attachUploadTime=" + attachUploadTime + ", taskHistCode=" + taskHistCode + ", userCode=" + userCode
            + ", attachType=" + attachType + ", thumbnailPath=" + thumbnailPath + ", attachSize=" + attachSize
            + "]";
   }
   
}