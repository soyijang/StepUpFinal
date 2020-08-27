<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/indiv/sprintBacklog/sprintBacklog.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/indiv/sprintBacklog/modal.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/button.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
   <c:set var="contextPath"
      value="${ pageContext.servletContext.contextPath }"
      scope="application" />

   <%@ include file="../common/menubar.jsp"%>
   <div id="content">
      <!-- 상단 프로젝트 제목 및 메뉴 이름 영역 -->
      <div id="contentTitle">
         <div id="projectTitle2">
            프로젝트백로그 /
            <c:out value="${ sprintList.get(0).project.projectName }" />
         </div>
         <div id="menuTitle">ProjectBacklog</div>
      </div>

      <!-- 상단검색,팀원 -->
      <div id="topArea">
         <!-- 검색 -->
         <div id="searchSprint">
            <input type="text" placeholder="Search or jump to ...">
         </div>

         <!-- 팀원 -->
         <div></div>
      </div>

      <!-- 아래쪽영역 -->

      <div id="bottomArea">
         <!-- 좌측영역 -->
         <div id="sprint">
            <div id="ListState">
               <button id="rectangle2">진행/예정</button>
               <button id="rectangle2">종료</button>
            </div>
            <div id="sprintList">
               <table>
                  <c:forEach var="i" begin="0" end="${fn:length(sprintList)-1}">
                     <tbody class="sprinttbody"
                        id="tbody${sprintList.get(i).sprint.sprintCode}"
                        onclick="tbodyClick(${sprintList.get(i).sprint.sprintCode},'${ sprintList.get(i).sprintName }')">
                        <tr>
                           <td class="progressPercent" rowspan="2">00%</td>
                           <td class="sprintName" colspan="2"><c:out
                                 value="${ sprintList.get(i).sprintName }" /></td>
                        </tr>
                        <tr>
                           <td class="progressLine" colspan="2"><c:out
                                 value="${ sprintList.get(i).member.userName }" /></td>
                           <td><input type="hidden" name="sendSprintCode" id="sendSprintCode" value="${sprintList.get(i).sprint.sprintCode}"></td>
                        </tr>
                     </tbody>
                  </c:forEach>
               </table>
            </div>
            <button class="SprintButtonArea" id="sprintapply">새 스프린트 생성</button>

            <!-- 클릭확인용 -->
         </div>

         <!-- ---------------------오른쪽------------------------- -->
         <div id="taskListArea">
            <jsp:include page="../projectTask/MainTask/taskDetail.jsp"/>
            <div class="taskButtonArea">
               <button class="taskapply" id="rectangle5" style="width: 100px;">Task 추가</button>
               <button id="rectangle5" class="updatebtn" style="width: 100px;">스프린트 편집</button>
               <button id="rectangle5" style="width: 100px;">스프린트 종료</button>
            </div>

            <div id="addPostPart"></div>

            <div id="sprintTaskList">
               <table>
                  <thead>
                     <tr>
                        <td width="50%">Task 명</td>
                        <td width="10%">실제소요시간</td>
                        <td width="10%">예상소요시간</td>
                        <td width="8%">Point</td>
                        <td width="8%">진행상태</td>
                        <td width="8%">담당자</td>
                        <td width="8%">더보기</td>
                     </tr>
                  </thead>

                  <tbody id="addTaskList">
                  
                  </tbody>
               </table>
            </div>
         </div>
      </div>
   </div>

   <!-- 스프린트추가 모달창 -->
   <form action="insert.st" method="post">
      <div id="newSprintModal" class="modal">
         <div class="modal-content">
            <p align="left" class="modaltitle">🎁 새 스프린트 생성</p>
            <table align="center" class="modalTable">
               <tbody>
                  <tr>
                     <td><b>[<c:out value="${ sprintList.get(0).project.projectName }" />]
                     </b>(프로젝트)에 새로운 스프린트를 추가하시겠습니까?</td>
                  </tr>
                  <tr>
                     <td>※초기 스프린트명은 스프린트 코드로 자동지정됩니다.</td>
                  </tr>
               </tbody>
            </table>
            <div class="modalButtonArea">
               <button class="" id="rectangle6" type="submit">저장</button>
               <div class="sprintclose" id="rectangle7">취소</div>
            </div>
            <input style="display: none" name="userProjectCode"
               value="${ sprintList.get(0).userProjectList.userProjectCode }">
         </div>
      </div>
   </form>
   
   <!-- 스프린트수정 모달창 -->
   <form action="update.st" method="post">
      <div id="updateSprint" class="modal">
         <div class="modal-content updatecontent">
            <p align="left" class="modaltitle">🎁 스프린트 수정하기</p>
            <table align="center" class="SprintUpdateModalTable">
               <tbody>
                  <tr>
                     <td>스프린트명 : </td>
                     <td><b id="updateSprintName"></b></td>
                  </tr>
                  <tr>
                     <td>스프린트코드 : </td>
                     <td><b id="updateSprintCode"></b></td>
                  </tr>
                  <tr>
                     
                  </tr>
               </tbody>
            </table>
            <div class="modalButtonArea">
               <button class="" id="rectangle6" type="submit">저장</button>
               <div class="sprintupdateclose" id="rectangle7">취소</div>
            </div>
            <input style="display: none" name="userProjectCode"
               value="${ sprintList.get(0).userProjectList.userProjectCode }">
         </div>
      </div>
   </form>

   <script type="text/javascript">
      var newSprintModal = document.getElementById("newSprintModal");
      var updateSprint = document.getElementById("updateSprint");
       var taskmodal = document.getElementById("taskmyModal");
       
       
      var btn = document.getElementById("sprintapply");
      var btn2 = document.getElementsByClassName("updatebtn")[0];
      
       var span = document.getElementsByClassName("sprintclose")[0];
       var span2 = document.getElementsByClassName("sprintupdateclose")[0];
      
      btn.onclick = function() {
          $(newSprintModal).fadeIn(300); 
          $(newSprintModal).css('display','block');
      }
      
      btn2.onclick = function() {
          $(updateSprint).fadeIn(300); 
          $(updateSprint).css('display','block');
      }
      
      span.onclick = function() {
          $(newSprintModal).css('display','none');
      }
      
      span2.onclick = function() {
          $(updateSprint).css('display','none');
      }
      
      window.onclick = function(event) {
        if (event.target == newSprintModal) {
           newSprintModal.style.display = "none";
        }else if (event.target == updateSprint) {
           updateSprint.style.display = "none";
        }else if (event.target == taskmodal) {
              taskmodal.style.display = "none";
        }
      };
      
      
      $('.taskapply').click(function(){
         $(taskModalYn).fadeIn(300); 
         $(taskModalYn).css('display','block');
      });

   </script>


   <script type="text/javascript">   
   
   function tbodyClick(i, name) {
      
      /* 선택된 스프린트 코드 및 정보 알려주고 ajax에 넘겨주기 */
      var sprintCode = i;
      console.log(sprintCode +"번 스프린트");
      $('#sendSprintCode').val(sprintCode);
      $('#updateSprintCode').html(sprintCode);
      $('#sprintCode').val(sprintCode);
         
      /* 선택된 스프린트이름 편집모달에 알려주기 */
      var sprintName = name;
      console.log(sprintName);
      $('#updateSprintName').html(sprintName);
      
      
      var addPostPart = $('#addPostPart');
      var addPostPart2 = $('#addTaskList');
      
      $.ajax({
         type: "post",
         url: "showSprintDetail.st",
         data : {
            sprintCode : sprintCode
         },
         dataType: 'json',
         success : function(data) {
            console.log(data.sprint);
            if(data!=null){
               addPostPart.children().remove();
               addPostPart.prepend(
                  "<div id='sprintInfo'><div id='sprintCode'>" + data.sprint.sprintCode + "</div><div id='sprintInfomation'><table><tbody><tr><td>스프린트명 : " +
                  data.sprint.sprintName + "</td></tr><tr><td>스프린트 시작일 :" +  data.sprint.sprint.sprintCreateDate  + " / 예상소요시간 : " + data.sprint.sprint.sprintExpectPeriod + 
                  "m<td></tr></tbody></table></div><div id='sprintCounting'><table><tbody><tr><td><span class='pointAverage'>3.4pts</span></td><td>미완료</td><td><span class='tasknonFinish'>0</span></td><td>완료</td><td><span class='taskFinish'>1</span></td><td>진행중</td><td><span class='taskIng'>1</span></td><td>총 2개</td></tr></tbody></table></div>"+
                  "</div><div id='sprintIntro'>스프린트 설명 : " + data.sprint.sprint.sprintIntro + "</div>"
               );

            }
         },
         error : function() {
             addPostPart.children().remove();
               addPostPart.prepend(
                  "<div id='sprintInfo'><div id='sprintCode'>" + "0" + "</div><div id='sprintInfomation'><table><tbody><tr><td>스프린트명 :" +
                  " 스프린트가 없습니다." + "</td></tr><tr><td>스프린트 시작일 :" +  "--.--.--"  + " / 예상소요시간 : " +  "--.--.--" + 
                  "m<td></tr></tbody></table></div><div id='sprintCounting'><table><tbody><tr><td><span class='pointAverage'>3.4pts</span></td><td>미완료</td><td><span class='tasknonFinish'>0</span></td><td>완료</td><td><span class='taskFinish'>1</span></td><td>진행중</td><td><span class='taskIng'>1</span></td><td>총 2개</td></tr></tbody></table></div>"+                     
                  "</div><div id='sprintIntro'>스프린트 설명 : " + "스프린트가 없습니다." + "</div>"
               );
         }
         
      });
   
   }
   /* 
   addPostPart2.children().remove();
   addPostPart2.prepend(
      "<tr><td class='TaskName'>" + data.sprint.task.taskHistory.taskHistValue + "</td><td class='realTime'>" + 183m + "</td><td>160m</td><td>" + 
      4pts + "</td><td><span class='" + TaskStatus1 + "'>" + 완료 + "</span></td><td>" + 심슨 + "</td><td><button class='more'>...</button></td></tr>"
   ); */
</script>
</html>