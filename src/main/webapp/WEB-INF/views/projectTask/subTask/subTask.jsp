<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="subtaskDetailModal"  class="taskmodal">
      <!-- Modal content -->
      <div class="taskmodal-content"><!-- 
      	 <input type="text" name="taskCode" id="taskCode" value=""> -->
         <div class="projectList" id="project"><div id="storyicon"></div><p id="sprintName" value=""></p></div><div class="projectList">/</div>
         <div class="projectList" id="story"><div id="taskicon"></div>TEST<p id="taskCode" value=""></p></div>
         <div id="cancel"><img src="/agile/resources/icon/common/icon_x.png" class="taskclose"></div>
         <div id="additional" style="margin-right:50px; margin-top:5px; border:none; ">
         	<div class="taskdropdown2">
                    <div class="select">
                          <span id="user-list"><img src="/agile/resources/icon/common/icon_more horizontalicon.png" id="add"></span>
                      <i class="fa fa-chevron-left"></i>
                    </div>
                    <ul class="taskdropdown2-menu">
                      <li id="work" href = "javascript:void(0)" 
                onclick = "document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'">
                                         작업로그</li>
                      <li id="clone-task">복제</li>
                      <li id="delete-task">삭제</li>
                    </ul>
                  </div>
         </div>
         <div><img src="/agile/resources/icon/common/icon_shareicon.png" id="share"></div>
         <div><!-- <label id="count">1번</label> --><img src="/agile/resources/icon/common/icon_bookmarkicon.png" id="bookmark" value=""></div>
        <p align="left" class ="taskmodaltitle"><input type="text" placeholder="제목을 입력하세요" style="font-size:20px;" id="titleName" onkeyup="enterkey();" name="taskTitle" value=""></p>
        <input type="hidden" name="taskCategoryCode" id="taskCategoryCode" value="J">
        <input type="hidden" name="taskCode" id="taskCode" value="">
        <div id="leftContent">
        <table align="center" class="taskmodalTable"><!--  class="modal-dialog" -->
            <tr>
               <td>
               <button id="attachment"><img src = "/agile/resources/icon/common/icon_clip.png"><label class="subBtn">첨부</label></button>
               <form id="uploadForm" method="post" enctype="multipart/form-data" action="fileUpload" >
               <input type="file" name="upload" multiple="true" id="fileArea">
               <button id="uploadBtn" value="">업로드</button>
               </form>
               <button id="subtask"><img src = "/agile/resources/icon/common/icon_copyicon.png"><label class="subBtn">하위 테스크 생성</label></button>
               </td>
            </tr>
            <tr>
               <td id="intro" class="label">설명</td>
            </tr>
            <tr id="description">
               <td class="active"><input type="text" id="descript" name="descipt" placeholder="설명을 입력하세요" value=""></td>
            </tr>
            <tr id="htmlBox" style="display:none;">
               <td><textarea id="summernote" name="summernote" rows="10" cols="150" style="display:none;"></textarea></td>
               </div><input type="hidden" name="summerContent" id="summerContent">
               <input type="hidden" name="taskCategoryCode1" id="taskCategoryCode1" value="H">
            </tr>
            <tr id="htmlBtn" style="display:none;">
               <td><button id="desBtnCan" class="intBtn">Cancel</button>
               <button class="intBtn" onclick="updateDescipt()">Save</button></td>
            </tr>
            <div>
            <tr id="subTaskBox" style="display:none;">
               <td>하위 테스크</td>
            </tr>
            <table id="replySelect"><thead></thead><tbody></tbody></table>
            <tr id="subTaskText" style="display:none;"> 
               <td><input tyep="text" name="subTaskTitle" id="subTaskTitle" placeholder="무엇을해야합니까?" value=""></td>
            </tr>
            <tr id="subTaskBtn" style="display:none;">
               <td>
               <button id="subTaskCan" class="subTaskBtn">취소</button>
               <button id="subTaskMake"class="subTaskBtn" onclick="insertSubTask()">만들기</button>
               </td>
               <input type="hidden" name="subTaskCode" id="subTaskCode" value=""> 
               <input type="hidden" name="taskCategoryCode" id="taskCategoryCode2" value="J">           
            </tr><!-- 
            <tr>
               <td >활동</td>
            </tr> -->
        </table>
        	<div id="activity" class="label">활동</div>
        	<div class="container">
 
		        <ul class="tabs">
		          <li id="replyTab" class="tab-link current" data-tab="tab-1">댓글</li>
		          <li class="tab-link" data-tab="tab-2">기록</li>
		          <li class="tab-link" data-tab="tab-3">작업로그</li>
		        </ul>
		       
		        <div id="tab-1" class="tab-content current">
		        	<table id="replySelectTable"><thead></thead><tbody></tbody></table>
		        </div>
		        	<div class="profile" id="user"></div><label><c:out value="${ sessionScope.loginUser.userName }"/></label>
		               <input type="text" placeholder="댓글추가...." id="replyContents" value="">
		               <button id="replyBtn" class="replyBtn" onclick="insertReply()">등록</button>
		               <button id="replyBtnCan" class="replyBtn" >취소</button>
		               <input type="hidden" name="taskCategoryCode3" id="taskCategoryCode3" value="K">
		               <input type="hidden" id="replyHistCode">
		        	
		        
		        <div id="tab-2" class="tab-content">
		        	<div>기</div>
		        	<div>록</div>
		        </div>
		        
		        <div id="tab-3" class="tab-content">
		      		<div>활</div>
		        	<div>동</div>
		         </div>
		       
		      </div>
        
        </div>
       
       
       <!-------------------- 오른쪽 ----------------------------->
        <div id="detail">
           <table>
           	  <tr>
           	  	<div class="taskdropdown">
                    <div class="select">
                          <span id="not-start" value="not-start">미진행 v</span>
                      <i class="fa fa-chevron-left"></i>
                    </div>
                    <ul class="taskdropdown-menu" id="taskdropdown-menu">
                      <li class="taskStatus" id="work" value="work" onclick="taskStatus1()">진행중</li>
                      <li class="taskStatus" id="done" value="done" onclick="taskStatus2()">완료</li>
                    </ul>
                  </div>
                  </td>
           	  </tr>
              <tr>
                 <td><label>담당자</label></td>
              </tr>
             <tr>
                <td colspan="2"><!-- <div class="detailprofile" id="dProfile"></div>
                 <input type="text" placeholder="할당해제 됨" id="master" name="worker" class="worker"> -->
                 <div class="taskdropdown">
                    <div class="select">
                          <span id="user-list" onclick="selectTeam()"><div class="detailprofile" id="dProfile"></div>할당해제 됨</span>
                      <i class="fa fa-chevron-left"></i>
                    </div>
                    <ul id="teamlist2" class="taskdropdown-menu" >
                    <!-- <li id="work">심</li>
                      <li id="rest">다</li>
                      <li id="travel">윤</li>  -->
                    </ul>
                  </div>
                  </td>
                 <input type="hidden" name="taskCategoryCode4" id="taskCategoryCode4" value="L">
             </tr>
              <tr>
                 <td><label>보고자</label></td>
              </tr>
              <tr>
                <td colspan="2"><!-- <div class="detailprofile" id="bProfile"></div>
                 <input type="text" placeholder="할당해제 됨" id="bogo" class="worker"> -->
                 <div class="taskdropdown">
                    <div class="select">
                          <span id="user-list" onclick="teamSelect()"><div class="detailprofile" id="dProfile"></div>할당해제 됨</span>
                      <i class="fa fa-chevron-left"></i>
                    </div>
                    <ul id="teamlist" class="taskdropdown-menu">
                    </ul>
                  </div>
                 </td>
                 <input type="hidden" name="taskCategoryCode5" id="taskCategoryCode5" value="M">
             </tr>
             <tr>
                <td class="rTitle">스프린트 </td>
             </tr>
             <tr>
                <td><p id="sprintName" val=""></p></td>
             </tr>
             <tr>
                <td class="rTitle">레이블</td>
                <input type="hidden" name="taskCategoryCode6" id="taskCategoryCode6" value="N">
             </tr>
             <tr>
                <td><input type="text" placeholder="없음" class="dinput" id="labelText" value=""></td>
                <td><button type="submit" class="btn" id="labelBtn" onclick="insertLabel()" ><img src="/agile/resources/icon/common/icon_check.png" class="btnImage" style="width:10px; height:10px;"></button></td>
             </tr>
             <tr>
                <td class="rTitle">Story Points</td>
             </tr>
             <tr>
                <td><input type="text" id="pointText" name="amount" value=""></td>
                <td><button type="submit" class="btn" id="pointBtn" onclick="insertPoint()"><img src="/agile/resources/icon/common/icon_check.png" class="btnImage" style="width:10px; height:10px;"></button></td>
                <input type="hidden" name="taskCategoryCode7" id="taskCategoryCode7" value="D">
             </tr>
             <tr>
                <td class="rTitle">최초예상</td>
             </tr>
             <tr>
                <td><input type="datetime" placeholder="0m" class="dinput" id="expectText" name="expectTime" value=""></td>
                <td><button type="submit" class="btn" id="expectBtn" onclick="insertExpect()"><img src="/agile/resources/icon/common/icon_check.png" class="btnImage" style="width:10px; height:10px;"></button></td>
                <input type="hidden" name="taskCategoryCode8" id="taskCategoryCode8" value="A">
             </tr>
             <tr>
                <td class="rTitle">시간추적</td>
             </tr>
             <tr>
                <td><img src = "/agile/resources/icon/common/icon_clock.png"></td>
             <!--    <td><a href = "javascript:void(0)" 
                onclick = "document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'">여기</a></td>  -->
                <input type="hidden" name="taskCategoryCode9" id="taskCategoryCode9" value="B">
             </tr>
             <tr>
                <td class="rTitle">우선 순위
                <div class="taskdropdown">
                    <div class="select">
                          <span id="user-list">
							<img src="/agile/resources/icon/common/icon_arrow_upward_orange.png" style="width:20px; height:20px; float:left;">
							<label style="color:#FF6B00">Medium</label>
						  </span>
                      <i class="fa fa-chevron-left"></i>
                    </div>
                    <ul class="taskdropdown-menu">
                      <li id="high" value="high" onclick="taskProperty1();"><label style="color:#DD0351"><img src="/agile/resources/icon/common/icon_arrow_upward_red.png" style="width:20px; height:20px; float:left;">High</label></li>
                      <li id="medium" value="medium" onclick="taskProperty2();"><label style="color:#FF6B00"><img src="/agile/resources/icon/common/icon_arrow_upward_orange.png" style="width:20px; height:20px; float:left;">Medium</label></li>
                      <li id="low" value="low" onclick="taskProperty3();"><label style="color:#03A500"><img src="/agile/resources/icon/common/icon_arrow_downward_green.png" style="width:20px; height:20px; float:left;">Low</label></li>
                    </ul>
                  </div>
                 </td>
                <input type="hidden" name="taskCategoryCode10" id="taskCategoryCode10" value="C">
             </tr>
             <tr>
                <td></td>
             </tr>
             <tr>
                <td><hr></td>
             </tr>
             <tr>
                <td>생성됨</td><td id="makeDate" value=""></td><td id="makeTime" value=""></td>
             </tr>
             <tr>
                <td>2초전 업데이트</td>
             </tr>
           </table>
        </div>
    </div>
   </div>
</body>
</html>